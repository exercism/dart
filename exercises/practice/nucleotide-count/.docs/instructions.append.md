# Instructions append

There are times when you need to handle unexpected issues that arise during code execution.
In Dart, you can use exceptions to handle these situations.

To throw an exception in Dart, use the `throw` keyword followed by an instance of the specific exception you want to raise.
For example, `throw Exception()` throws an instance of the base Exception type.

In this exercise, you need to define a custom exception called `InvalidNucleotideException`.
This exception should be raised when an invalid nucleotide is encountered.
The test suite only checks that an instance of `InvalidNucleotideException` is passed, so you have the freedom to implement it as you see fit as long as it is correctly thrown.

For more information on exceptions in Dart, you can refer to the [exceptions documentation](https://dart.dev/language/error-handling).
