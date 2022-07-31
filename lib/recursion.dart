// Recursion is a method of solving a computational problem where the solution depends on solutions to smaller instances of the same problem.
// Most computer programming languages support recursion by allowing a function to call itself from within its own code.
// Base case: A recursive function definition has one or more base cases, meaning input(s) for which the function produces a result trivially (without recurring).

// 1. Fibonacci sequence - each number is the sum of the two preceding ones.
// The sequence (commonly) starts from 0 and 1.
// f(n) = f(n-1) + f(n-2), f(0)=0 and f(1)=1

// 2. The factorial of a non-negative integer n, denoted by n!,
// is the product of all positive integers less than or equal to n.
// f(n) = n * f(n-1) and f(0) = 1

// Problemi baştan sona değil de, sondan başa doğru düşünüyoruz.
// 5! için normal yaklaşım 1*2*3*4*5 iken recursive yaklaşım 5 * 4!

var fibonacciCache = <int, int>{};

void main(List<String> args) {
  print(args);
  int n = 5;
  // Try to parse command line arg
  if (args.isEmpty) {
    print("Please provide command line parameter for n.");
    return;
  } else {
    // if you can parse, update n, else remain as it is.
    n = int.tryParse(args[0]) ?? n;
  }

  // var fibo = fibonacci(n);
  // var fibo = fibonacciOptimized(n);
  // print("fibonacci($n): $fibo");

  var f = factorial(n);
  var fr = factorialRecursive(n);
  print("factorial($n): $f, $fr");
}

int fibonacci(int n) {
  // base case exit
  if (n <= 1) return n;

  return fibonacci(n - 1) + fibonacci(n - 2);
}

int fibonacciOptimized(int n) {
  // base case exit
  if (n <= 1) return n;

  // first, look into the cache if it was calculated previously
  if (fibonacciCache.containsKey(n)) {
    return fibonacciCache[n]!;
  } else {
    int nthFibonacciNumber =
        fibonacciOptimized(n - 1) + fibonacciOptimized(n - 2);

    fibonacciCache[n] = nthFibonacciNumber;
    return nthFibonacciNumber;
  }
}

int factorialRecursive(int n) {
  //base case, 0! = 1
  if (n == 0) return 1;

  return n * factorial(n - 1);
}

int factorial(n) {
  int result = 1;
  for (var i = 1; i <= n; i++) {
    result = result * i;
  }
  return result;
}
