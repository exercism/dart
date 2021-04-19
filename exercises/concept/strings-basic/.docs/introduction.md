# Introduction

Strings are immutable objects in Dart. This means while their value cannot be changed, actions can be performed that creates a copy of an existing string which contains differences from the original.

```dart
  var string = 'Dart is fun';
  var newString = string.replaceFirst('fun', 'cool');

  print(string); // Dart is fun
  print(newString); // Dart is cool
```

Strings are useful for holding data that can be represented in text form. Some
operations on strings are to check their `length`, to build and concatenate
them using the `+` and `+=` string operators, checking for the existence or
location of substrings with the `indexOf()` method, extracting substrings
with the `substring()` method, or replacing the first occurrence of a string
with `replaceFirst()`
