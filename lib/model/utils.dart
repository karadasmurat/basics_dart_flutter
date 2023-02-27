/*
Utility class with a static method called getFirstCharacter()
 */
class StringUtils {
  static String getFirstCharacter(String str) {
    // If the str is not empty, extract the first character using the substring() method
    return (str.isEmpty) ? "" : str.substring(0, 1);
  }
}

/*
Extension methods allows you to (pretend to) add new members to existing types.
When you’re using someone else’s API or when you implement a library that’s widely used, it’s often impractical or impossible to change the API. 
(i.e, if you modify an existing interface, any other class implementing that interface will then be incomplete and will no longer compile.)
But you might still want to add some functionality. 

Extensions are static. Everything about them is decided based on static types.

You can define extension members for instance methods, operators, setters and getters, but not fields.

      // Import a library that contains an extension on String.
      import 'string_apis.dart';
      print('42'.parseInt()); // Use an extension method.

You can invoke extension methods either explicitly or — when there’s no conflict with an interface member or another extension — implicitly:

Ext1(list).bubbleSort() // Explicit, like it's a wrapper class.
list.bubbleSort()       // Implicitly, like it extends the type.

 */

extension StringMKExt on String {
  // Property Extension
  String get last => (this.isEmpty) ? "" : this[this.length - 1];

  String getFirstCharacter() {
    // If the str is not empty, extract the first character using the substring() method
    return (this.isEmpty) ? "" : this.substring(0, 1);
  }
}
