# Minesweeper

Minesweeper is a popular game where the user has to find the mines using
numeric hints that indicate how many mines are directly adjacent
(**horizontally**, **vertically**, **diagonally**) to a square.

In this exercise you have to create some code that counts the number of
mines adjacent to a square and transforms boards like this (where `*`
indicates a mine):

    +-----+
    | * * |
    |  *  |
    |  *  |
    |     |
    +-----+

into this:

    +-----+
    |1*3*1|
    |13*31|
    | 2*2 |
    | 111 |
    +-----+

### Example input : A List of Strings.
```dart
[
        " *  * ",
        "  *   ",
        "    * ",
        "   * *",
        " *  * ",
        "      "
]
```
### Expected output : A List of Strings.
```dart
[
        "1*22*1",
        "12*322",
        " 123*2",
        "112*4*",
        "1*22*2",
        "111111"
]
```
*Leave a space, in case there are no nearby mines.

## Hints
- You can use 2D Arrays (i.e. 2 dimentional lists in dart).
- You can also utilize Maps.
- You can create your own 1 or more custom data types (class).
- To get an idea of how to create Minesweeper, check out [this](https://www.youtube.com/watch?v=LFU5ZlrR21E) video.


## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.