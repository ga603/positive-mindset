class Quote {
  final String id;
  final String categoryId;
  final Map<String, String> translations;
  final String author;
  final String source;
  final String? bibleReference;
  final bool isBibleVerse;

  const Quote({
    required this.id,
    required this.categoryId,
    required this.translations,
    this.author = 'Positive Mindset',
    this.source = 'Original',
    this.bibleReference,
    this.isBibleVerse = false,
  });

  // NEW: Factory constructor to convert Firestore data into a Quote object
  factory Quote.fromFirestore(Map<String, dynamic> data, String id) {
    return Quote(
      id: id,
      categoryId: data['categoryId'] ?? 'daily',
      // Safely convert the Firestore map into a Dart map
      translations: Map<String, String>.from(data['translations'] ?? {}),
      author: data['author'] ?? 'Positive Mindset',
      source: data['source'] ?? 'Original',
      bibleReference: data['bibleReference'],
      isBibleVerse: data['isBibleVerse'] ?? false,
    );
  }

  String getText(String languageCode) {
    return translations[languageCode] ?? translations['en'] ?? '';
  }
}