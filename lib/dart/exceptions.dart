void main(List<String> args) {
  exceptionBasics();
}
// An [Exception] is intended to convey information to the user about a failure,
// so that the error can be addressed programmatically.
// It is intended to be caught, and it should contain useful data fields.

// implementation of [Exception] which carries a message.
class MKException implements Exception {
  final String? message;

  // Optional positional parameter ?!
  MKException([this.message]);

  @override
  String toString() {
    return message == null ? "MKException" : "Exception: $message";
  }
}

void doSomethingToSolveTheIssue() {
  print("Doing my best to handle the exception..");
}

void mayThrowAnException() {
  throw MKException("Here is a MKException");
  //throw FormatException("Here is a format exception");
}

// You can use either on or catch or both.
// Use on when you need to specify the exception type.
// Use catch when your exception handler needs the exception object.
void exceptionBasics() {
  try {
    mayThrowAnException();
  } on FormatException {
    doSomethingToSolveTheIssue(); // exception object is not needed.
  } on MKException catch (e) {
    // Anything else that is an exception
    print(e);
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  } finally {
    // To ensure that some code runs whether or not an exception is thrown
    print("Finally block executes wheter or not an exception is caught."); // Then clean up.
  }
}
