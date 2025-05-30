enum Language {
  english,
  chinese,
  auto,
  unknown,
}

extension LanguageX on Language {
  String get name {
    switch (this) {
      case Language.english:
        return 'English';
      case Language.chinese:
        return 'Chinese';
      case Language.auto:
        return 'Automatic';
      case Language.unknown:
        return 'Unknown';
    }
  }

  String? get code {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.chinese:
        return 'zh';
      case Language.auto:
        return 'auto';
      case Language.unknown:
        return null;
    }
  }
}
