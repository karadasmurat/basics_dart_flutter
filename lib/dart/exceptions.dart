/*

Exceptions are errors indicating that something unexpected happened. 
If the exception isn’t caught, the isolate that raised the exception is suspended, and typically the isolate and its program are terminated.

In contrast to Java, all of Dart’s exceptions are unchecked exceptions. 
Methods don’t declare which exceptions they might throw, and you aren’t required to catch any exceptions.

Throw:
Dart provides Exception and Error types, as well as numerous predefined subtypes.
Exceptions are considered conditions that you can plan ahead for and catch. Errors are conditions that you don’t expect or plan for.

You can define your own exceptions. 
However, Dart programs can throw any non-null object—not just Exception and Error objects—as an exception.
Note that Production-quality code usually throws types that implement 'Error' or 'Exception'.

    throw FormatException('Expected at least 1 section');
    throw 'Out of llamas!'; // You can throw arbitrary objects

Catch:
Catching, or capturing, an exception stops the exception from propagating (unless you rethrow the exception). 
Catching an exception gives you a chance to handle it.

To handle code that can throw more than one type of exception, you can specify multiple catch clauses. 
The first catch clause that matches the thrown object’s type handles the exception. 

    try {
      breedMoreLlamas();
    } on OutOfLlamasException {
      // A specific exception
      buyMoreLlamas();
    } on Exception catch (e) {
      // Anything else that is an exception
      print('Unknown exception: $e');
    } catch (e) {
      // No specified type, handles all
      print('Something really unknown: $e');
    }

*/
void main(List<String> args) {
  exceptionBasics();
}

// An [Exception] is intended to convey information to the user about a failure,
// so that the error can be addressed programmatically.
// It is intended to be caught, and it should contain useful data fields.
// implementation of [Exception] which carries a message.
// Note that Exception is an abstract class, and there is a default implementation: class _Exception implements Exception
class MKException implements Exception {
  final String? message;

  MKException([this.message]); // Positional Optional Parameter

  @override
  String toString() {
    return message == null ? "MKException" : "Exception: $message";
  }
}

void doSomethingToSolveTheIssue() {
  print("Doing my best to handle the exception..");
}

void throwCustomException() {
  throw MKException("Here is a MKException");
  //throw FormatException("Here is a format exception");
}

// You can use either on or catch or both.
// Use on when you need to specify the exception type.
// Use catch when your exception handler needs the exception object.
void exceptionBasics() {
  try {
    throwCustomException();
  } on FormatException {
    // A specific exception
    // exception object is not needed, not caught!
    doSomethingToSolveTheIssue();
  } on MKException catch (e) {
    // A specific exception
    print(e);
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }

  try {
    // nothing to worry, but still use 'try'
    var x = 10;
  } catch (e) {
    // No specified type, handles all
    print(e);
  } finally {
    // To ensure that some code runs whether or not an exception is thrown
    // Note that Finally block executes wheter or not an exception is caught.
    print("FINALLY cleaning up.");
  }
}
