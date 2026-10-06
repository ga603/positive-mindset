import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/quote.dart';
import '../data/quotes_data.dart'; // We keep this as an offline fallback!

abstract class QuoteRepository {
  // Notice these now return "Future<Quote>" because downloading takes a split second
  Future<Quote> getRandomQuote();
  Future<Quote> getRandomQuoteByCategory(String categoryId);
  Future<Quote> getQuoteOfTheDay();
}

class AppQuoteRepository implements QuoteRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _random = Random();
  
  List<Quote> _cloudQuotes = [];
  bool _hasFetched = false;

  // Downloads quotes from Firebase, or skips if already downloaded
  Future<void> _ensureDataLoaded() async {
    if (_hasFetched) return;
    try {
      final snapshot = await _firestore.collection('quotes').get();
      _cloudQuotes = snapshot.docs.map((doc) => Quote.fromFirestore(doc.data(), doc.id)).toList();
      _hasFetched = true;
    } catch (e) {
      print("Firestore error (using offline fallback): $e");
    }
  }

  // If we have cloud quotes, use them! Otherwise, use the local starter list.
  List<Quote> get _activeQuotes => _cloudQuotes.isNotEmpty ? _cloudQuotes : initialQuotes;

  @override
  Future<Quote> getRandomQuote() async {
    await _ensureDataLoaded();
    return _activeQuotes[_random.nextInt(_activeQuotes.length)];
  }

  @override
  Future<Quote> getRandomQuoteByCategory(String categoryId) async {
    await _ensureDataLoaded();
    final categoryQuotes = _activeQuotes.where((q) => q.categoryId == categoryId).toList();
    
    if (categoryQuotes.isEmpty) return getRandomQuote();
    return categoryQuotes[_random.nextInt(categoryQuotes.length)];
  }

  @override
  Future<Quote> getQuoteOfTheDay() async {
    await _ensureDataLoaded();
    final now = DateTime.now();
    final dateString = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
    final dateInt = int.parse(dateString);
    
    return _activeQuotes[dateInt % _activeQuotes.length];
  }
}