void main(List<String> args) {
  var emailCandidates = ["test", "test@", "test@test", "test@test.com"];

  for (var i in emailCandidates) {
    var email = EmailAddress.parse(i);
    print(email ?? "Not an email");
  }
}

class EmailAddress {
  String email;

  EmailAddress(this.email);

  static EmailAddress? parse(String anEmail) {
    final emailPattern = RegExp(
      r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b',
      caseSensitive: false,
      multiLine: true,
    );

    final firstMatch = emailPattern.firstMatch(anEmail)?.group(0);

    if (firstMatch != null) {
      return EmailAddress(firstMatch);
    }
  }

  @override
  String toString() {
    return "{$email}";
  }
}
