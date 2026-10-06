import 'package:flutter/material.dart';
import '../data/categories_data.dart';
import '../localization/language_manager.dart';
import '../models/quote.dart';
import '../repositories/quote_repository.dart';
import '../services/sharing_service.dart';
import '../widgets/quote_card.dart';

class QuoteScreen extends StatefulWidget {
  final String? categoryId;

  const QuoteScreen({super.key, this.categoryId});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final AppQuoteRepository _repository = AppQuoteRepository();
  late Future<Quote> _quoteFuture;

  @override
  void initState() {
    super.initState();
    _quoteFuture = _getQuote();
  }

  Future<Quote> _getQuote() {
    final categoryId = widget.categoryId;
    if (categoryId == null) {
      return _repository.getRandomQuote();
    }
    return _repository.getRandomQuoteByCategory(categoryId);
  }

  void _loadNextQuote() {
    setState(() {
      _quoteFuture = _getQuote();
    });
  }

  Future<void> _shareQuote(Quote quote, String languageCode) async {
    try {
      final shared = await SharingService.shareQuote(quote, languageCode);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(shared ? 'Quote shared' : 'Quote copied to clipboard'),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Unable to share quote: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = initialCategories
        .where((category) => category.id == widget.categoryId)
        .map((category) => category.name)
        .firstOrNull;

    return ValueListenableBuilder<String>(
      valueListenable: LanguageManager.currentLanguage,
      builder: (context, languageCode, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFFBFBF9),
          appBar: AppBar(
            title: Text(categoryName ?? 'Daily Encouragement'),
            centerTitle: true,
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FutureBuilder<Quote>(
                  future: _quoteFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(height: 12),
                            const Text('Could not load a quote.'),
                            const SizedBox(height: 12),
                            FilledButton(
                              onPressed: _loadNextQuote,
                              child: const Text('Try again'),
                            ),
                          ],
                        ),
                      );
                    }

                    final quote = snapshot.data;
                    if (quote == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: QuoteCard(
                              key: ValueKey(quote.id),
                              quote: quote,
                              languageCode: languageCode,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () =>
                                    _shareQuote(quote, languageCode),
                                icon: const Icon(Icons.share_outlined),
                                label: const Text('Share'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: _loadNextQuote,
                                icon: const Icon(Icons.auto_awesome),
                                label: Text(
                                  LanguageManager.getText('next_quote'),
                                ),
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF2E7D32),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
