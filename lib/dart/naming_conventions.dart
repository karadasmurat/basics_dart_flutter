void main(List<String> args) {
  var conventions = {
    "camelCase": 1,
    "PascalCase": 2,
    "snake_case": 3,
    "UPPER_SNAKE_CASE": 4,
    "kebab-case": 5,
  };

  conventions.forEach((key, value) {
    print(key);
  });
}
