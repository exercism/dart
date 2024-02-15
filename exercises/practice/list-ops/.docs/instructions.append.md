# ignore

## Dart-specific instructions

The `append` method mutates the receiver.
All other methods return a new List.

We can't override builtin methods and properties:
instead of `length`, implement `count`;
instead of `map`, implement `myMap`.

You will be adding [Extension methods][extension] to the List class.
Try not to rely too much on the builtin methods and properties of List and Iterable,
implement the functionality yourself as much as you can.

You'll notice that the provided stub file uses [Generics][generics].

[extension]: https://dart.dev/language/extension-methods
[generics]: https://dart.dev/language/generics
