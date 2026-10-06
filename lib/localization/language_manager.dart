import 'package:flutter/material.dart';

class LanguageManager {
  static final ValueNotifier<String> currentLanguage = ValueNotifier<String>('en');
  
  static final Map<String, String> supportedLanguages = {
    'en': '🇬🇧 English',
    'de': '🇩🇪 Deutsch',
    'sw': '🇰🇪 Kiswahili',
  };

  // Basic dictionary for our UI elements
  static final Map<String, Map<String, String>> _uiStrings = {
    'en': {
      'hero': 'A little encouragement for your day.',
      'subtitle': 'Take a deep breath and pick what you need right now.',
      'give_encouragement': 'Give Me Encouragement',
      'quote_of_day': 'QUOTE OF THE DAY',
      'what_do_you_need': 'What do you need today?',
      'next_quote': 'NEXT QUOTE',
    },
    'de': {
      'hero': 'Ein wenig Ermutigung für deinen Tag.',
      'subtitle': 'Atme tief durch und wähle, was du gerade brauchst.',
      'give_encouragement': 'Gib mir Ermutigung',
      'quote_of_day': 'ZITAT DES TAGES',
      'what_do_you_need': 'Was brauchst du heute?',
      'next_quote': 'NÄCHSTES ZITAT',
    },
    'sw': {
      'hero': 'Kutiwa moyo kidogo kwa siku yako.',
      'subtitle': 'Vuta pumzi na uchague unachohitaji sasa hivi.',
      'give_encouragement': 'Nipe Moyo',
      'quote_of_day': 'NUKUU YA SIKU',
      'what_do_you_need': 'Unahitaji nini leo?',
      'next_quote': 'NUKUU IJAYO',
    },
  };

  static String getText(String key) {
    return _uiStrings[currentLanguage.value]?[key] ?? _uiStrings['en']![key]!;
  }

  static void setLanguage(String code) {
    if (supportedLanguages.containsKey(code)) {
      currentLanguage.value = code;
    }
  }
}