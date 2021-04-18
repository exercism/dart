# About

Strings are useful for holding data that can be represented in text form. Strings are immutable objects in Dart. This means while their value cannot be changed, actions can be performed that creates a copy of an existing string which contains differences from the original.

There's a way to access an individual character in a string.

The first step is to use the `indexOf()` method to get the location of the character:

```dart
'cat'.indexOf('a');
// => 1
```

The next step is to use the index from above to get the character:

```dart
'cat'[1];
// => "a"
```

Some operations on strings are to check their `length` and to concatenate them using the `+` string operators.

```dart
'cat'.length;
// => 3

'I like' + 'cats';
// => "I like cats"
```

You can find all the methods in the [documentation for the String API][string-api].

## String interpolation

Strings in Dart support concatenation using `+` and interpolation (See the [Strings section of the Language Tour][strings-tour]).

```dart
const NUMBER_OF_CATS = 4;
const concatenation = 'I have ' + NUMBER_OF_CATS + ' cats';
// => "I have 4 cats"

const interpolation1 = 'I have $NUMBER_OF_CATS cats';
// => I have 4 cats

const interpolation2 = 'I have more than ${NUMBER_OF_CATS - 1} cats';
// => I have more than 3 cats
```

[string-api]: https://api.dart.dev/stable/2.12.4/dart-core/String-class.html
[strings-tour]: https://dart.dev/guides/language/language-tour#strings