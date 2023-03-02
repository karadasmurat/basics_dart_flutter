// Client's main functon
void main(List<String> args) {
  // already existing part. client expects Crypt interface
  Crypt cryptService = CryptService();
  cryptService.encrypt("MK");

  // new adapter
  // create 3rd party service and inject it into the adapter with expected interface
  var fc = FancyCrypt();
  Crypt fancyAdapter = FancyCryptAdapter(fc);
  fancyAdapter.encrypt("MK");
}

/* ---- EXISTING CODE ----- */

abstract class Crypt {
  void encrypt(String arg);
  void decrypt(String arg);
}

// Existing concrete implementation, the client already uses.
class CryptService implements Crypt {
  @override
  void encrypt(String arg) {
    print("Encrypting $arg ...");
  }

  @override
  void decrypt(String arg) {
    print("Decrypting $arg ...");
  }
}

// New 3rd party implementation we would like to use.
class FancyCrypt {
  void textToCode(String text) {
    print("Fancy implementation to encrypt $text.");
  }

  void codeToText(String text) {
    print("Fancy implementation for decrypt $text.");
  }
}

/* ---- NEW CODE / ADAPTER ----- */

// Client expects Crypt interface, so we implement it.
class FancyCryptAdapter implements Crypt {
  FancyCrypt fc; // wrap

  FancyCryptAdapter(this.fc);

  @override
  void encrypt(String arg) {
    // call wrapped method implementation
    fc.textToCode(arg);
  }

  @override
  void decrypt(String arg) {
    // call wrapped method implementation
    fc.codeToText(arg);
  }
}
