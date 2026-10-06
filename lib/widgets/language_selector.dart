import 'package:flutter/material.dart';
import '../localization/language_manager.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: LanguageManager.currentLanguage,
      builder: (context, currentLang, child) {
        return PopupMenuButton<String>(
          icon: const Icon(Icons.language_outlined),
          tooltip: 'Change Language',
          onSelected: (String code) {
            LanguageManager.setLanguage(code);
          },
          itemBuilder: (BuildContext context) {
            return LanguageManager.supportedLanguages.entries.map((entry) {
              return PopupMenuItem<String>(
                value: entry.key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.value),
                    if (currentLang == entry.key)
                      const Icon(Icons.check, size: 18, color: Colors.green),
                  ],
                ),
              );
            }).toList();
          },
        );
      },
    );
  }
}