import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/quote.dart';

class SharingService {
  static Future<bool> shareQuote(Quote quote, String languageCode) async {
    final text = quote.getText(languageCode);
    final source = quote.isBibleVerse 
        ? (quote.bibleReference ?? 'Bible') 
        : 'Positive Mindset';
        
    final shareText = '"$text"\n\n— $source\n\nhttps://positive-mindset.web.app';

    // Force clipboard copy on Web to avoid the messy "mailto:" tab on desktop browsers.
    // On mobile devices, this will still trigger the native share sheet.
    if (kIsWeb) {
      await Clipboard.setData(ClipboardData(text: shareText));
      return false; // Tells the UI we used the clipboard fallback
    }

    try {
      await Share.share(shareText);
      return true;
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: shareText));
      return false; 
    }
  }
}