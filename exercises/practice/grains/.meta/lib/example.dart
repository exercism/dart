int square(final int n) {
  if (1 > n > 64) { 
    throw "square must be between 1 and 64";
  } 

  return 2 ** (n - 1);
}

int total() {
  return (2 ** 64) - 1;
}
