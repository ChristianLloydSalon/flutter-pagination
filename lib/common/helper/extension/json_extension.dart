extension JsonExtension on Map<String, dynamic> {
  String? tryParseString(String key) {
    if (containsKey(key)) {
      return this[key] as String;
    }

    return null;
  }

  String parseString(String key) {
    return tryParseString(key) ?? '';
  }

  int? tryParseInt(String key) {
    if (containsKey(key)) {
      return this[key] as int;
    }

    return null;
  }

  int parseInt(String key) {
    return tryParseInt(key) ?? 0;
  }

  double? tryParseDouble(String key) {
    if (containsKey(key)) {
      return this[key] as double;
    }

    return null;
  }

  double parseDouble(String key) {
    return tryParseDouble(key) ?? 0.0;
  }

  bool? tryParseBool(String key) {
    if (containsKey(key)) {
      return this[key] as bool;
    }

    return null;
  }

  bool parseBool(String key) {
    return tryParseBool(key) ?? false;
  }

  DateTime? tryParseDateTime(String key) {
    if (containsKey(key)) {
      return DateTime.tryParse(this[key] as String);
    }

    return null;
  }

  DateTime parseDateTime(String key) {
    return tryParseDateTime(key) ?? DateTime(0);
  }

  Map<String, dynamic>? tryParseMap(String key) {
    if (containsKey(key)) {
      return this[key] as Map<String, dynamic>;
    }

    return null;
  }

  Map<String, dynamic> parseMap(String key) {
    return tryParseMap(key) ?? {};
  }
}
