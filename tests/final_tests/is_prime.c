unsigned int isPrime(int n) {
  if (n <= 1) {
    return 0;
  }
  if (n % 2 == 0) {
    return n == 2;
  }
  for (int i = 3; i * i <= n; i += 2) {
    if (n % i == 0) {
      return 0;
    }
  }
  return 1;
}

int main() {

  return isPrime(137);
}