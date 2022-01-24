class EmptyStringException implements Exception {
  static String errMsg() => "Please enter non empty value";
}

class NonNumericException implements Exception {
  static String errMsg() => "Value entered should be numeric";
}

class NonNaturalException implements Exception {
  static String errMsg() => "Value entered should be natural number";
}

class NonWholeException implements Exception {
  static String errMsg() => "Value entered should be natural number";
}

class OutOfRangeException implements Exception {
  static String errMsg() => "Value entered is out of range";
}

class AlphabetException implements Exception {
  static String errMsg() => "Name should only contain alphabets";
}

class CaseException implements Exception {
  static String errMsg() => "First letter of name should be capital";
}
