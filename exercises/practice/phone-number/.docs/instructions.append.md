## Tip

A function with a *return type* can only return data of that *type* and `null`.
However the function caller is only expecting one data type.

Example:
```dart
String hello(int a){
    if ( a == 0){
        return "a";
    } else {
        return null;
    }
}
```
To make it more clear that this function can also return `null` or more data types, use `dynamic`.
```dart
dynamic hello(int a){
    if ( a == 0){
        return "a";
    } else {
        return null;
    }
}
