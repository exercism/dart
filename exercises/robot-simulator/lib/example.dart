import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

class Robot {
  Orientation orientation;
  Position position;

  Robot(this.position, this.orientation);

  void move(String instructions) {
    instructions.split("").forEach((character) {
      switch (character) {
        case "R":
          _rotateClockwise();
          break;
        case "L":
          _rotateCounterClockwise();
          break;
        case "A":
          _advance();
          break;
        default:
          throw StateError("unexpected instruction $character");
      }
    });
  }

  void _rotateClockwise() {
    switch (orientation) {
      case Orientation.north:
        orientation = Orientation.east;
        break;
      case Orientation.east:
        orientation = Orientation.south;
        break;
      case Orientation.south:
        orientation = Orientation.west;
        break;
      case Orientation.west:
        orientation = Orientation.north;
        break;
      default:
        throw StateError("unexpected orientation $orientation");
    }
  }

  void _rotateCounterClockwise() {
    switch (orientation) {
      case Orientation.north:
        orientation = Orientation.west;
        break;
      case Orientation.west:
        orientation = Orientation.south;
        break;
      case Orientation.south:
        orientation = Orientation.east;
        break;
      case Orientation.east:
        orientation = Orientation.north;
        break;
      default:
        throw StateError("unexpected orientation $orientation");
    }
  }

  void _advance() {
    switch (orientation) {
      case Orientation.north:
        position.y++;
        break;
      case Orientation.west:
        position.x--;
        break;
      case Orientation.south:
        position.y--;
        break;
      case Orientation.east:
        position.x++;
        break;
      default:
        throw StateError("unexpected orientation $orientation");
    }
  }
}
