abstract class CollegeAppException implements Exception {
  final String errorMessage;

  CollegeAppException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class EmptyStringException extends CollegeAppException {
  EmptyStringException() : super("Empty string Exception");
}

class NonNumericException extends CollegeAppException {
  NonNumericException() : super("Value entered should be numeric");
}

class NonNaturalException extends CollegeAppException {
  NonNaturalException() : super("Value entered should be natural number");
}

class NonWholeException extends CollegeAppException {
  NonWholeException() : super("Value entered should be whole number");
}

class OutOfRangeException extends CollegeAppException {
  OutOfRangeException() : super("Value entered is out of range");
}

class AlphabetException extends CollegeAppException {
  AlphabetException() : super("Name should only contain alphabets");
}

class CaseException extends CollegeAppException {
  CaseException() : super("First letter of name should be capital");
}
