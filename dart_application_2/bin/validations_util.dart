import 'exceptions.dart';
import 'package:validators/validators.dart';

class ValidationsUtil {
  /**
   * given number should be numeric
   */
  static bool _isNumeric(String data) {
    bool exceptionFlag = true;
    try {
      double value = double.parse(data);
    } catch (e) {
      exceptionFlag = false;
    }
    return exceptionFlag;
  }

  /**
   * given option should be natural number
   */
  static bool _nonNatural(String data) {
    bool exceptionFlag = false;
    try {
      int value = int.parse(data);
      if (value <= 0) throw NonNaturalException();
    } on NonNaturalException {
      exceptionFlag = true;
    } catch (e) {
      exceptionFlag = true;
    }
    return exceptionFlag;
  }

  static bool _nonWhole(String data) {
    bool exceptionFlag = false;
    try {
      int value = int.parse(data);
      if (value < 0) throw NonWholeException();
    } on NonWholeException {
      exceptionFlag = true;
    } catch (e) {
      exceptionFlag = true;
    }
    return exceptionFlag;
  }

  /**
   * given option is out of range
   */
  static bool _inRange(int option, int rangeStart, int rangeEnd) {
    if (option >= rangeStart && option <= rangeEnd)
      return true;
    else
      return false;
  }

  // given string should contain all alphabets
  static bool _isAlphabet(String name) {
    if (isAlpha(name)) return true;
    return false;
  }
  /**
   *this method checks if given name starts with capital letter
   */

  static bool _isNotCapital(String name) {
    if (name[0].toUpperCase() == name[0]) return false;
    return true;
  }

  /**
   * validate given option:
   * criteria:
   * 1. Not empty
   * 2. Should be numeric
   * 3. Natural Number
   * 4. Within given range
   */
  static bool validateOption(String option, int rangeStart, int rangeEnd) {
    bool validationFlag = true;
    try {
      if (option.isEmpty) throw new EmptyStringException();
      if (!_isNumeric(option)) throw new NonNumericException();
      if (_nonWhole(option)) throw new NonWholeException();
      if (!_inRange(int.parse(option), rangeStart, rangeEnd))
        throw new OutOfRangeException();
    } on CollegeAppException catch (exception, stackTrace) {
      validationFlag = false;
      print(exception.toString());
      print(stackTrace);
    }
    return validationFlag;
  }
  /**
   * validate given name:
   * criteria:
   * 1. Not empty
   * 2. Should contain all alphabets
   * 3. First letter should be capital
   */

  static bool validateString(String name) {
    bool validationFlag = true;
    try {
      if (name.isEmpty) {
        throw new EmptyStringException();
      }
      if (!_isAlphabet(name)) {
        throw new AlphabetException();
      }
      if (_isNotCapital(name)) {
        throw new CaseException();
      }
    } on CollegeAppException catch (exception, stackTrace) {
      validationFlag = false;
      print(exception.toString());
      print(stackTrace);
    }
    return validationFlag;
  }

  /**
   * validates given number
   * criteria:
   * 1. Should not be empty
   * 2. Should be numeric
   * 3. Should be Natural Number
   */
  static bool validateNumber(String number) {
    bool validationFlag = true;
    try {
      if (number.isEmpty) {
        throw new EmptyStringException();
      }
      if (!_isNumeric(number)) {
        throw new NonNumericException();
      }
      if (_nonNatural(number)) {
        throw new NonNaturalException();
      }
    } on CollegeAppException catch (exception, stackTrace) {
      validationFlag = false;
      print(exception.toString());
      print(stackTrace);
    }
    return validationFlag;
  }
}
