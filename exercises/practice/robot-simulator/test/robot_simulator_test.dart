import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';
import 'package:robot_simulator/robot_simulator.dart';
import 'package:test/test.dart';

void expected(Robot robot, {required Position beAt, required Orientation faceTo}) {
  expect(robot.position, equals(beAt));
  expect(robot.orientation, equals(faceTo));
}

void main() {
  group('RobotSimulator: Create robot - ', createRobot);
  group('RobotSimulator: Rotating clockwise - ', rotatingClockwise);
  group('RobotSimulator: Rotating counter-clockwise - ', rotatingCounterClockwise);
  group('RobotSimulator: Moving forward one - ', movingForwardOne);
  group('RobotSimulator: Follow series of instructions - ', followSeriesOfInstructions);
}

void createRobot() {
  test('at origin facing north', () {
    final robot = Robot(Position(0, 0), Orientation.north);
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.north);
  }, skip: false);

  test('at negative position facing south', () {
    final robot = Robot(Position(-1, -1), Orientation.south);
    expected(robot, beAt: Position(-1, -1), faceTo: Orientation.south);
  }, skip: true);
}

void rotatingClockwise() {
  test('changes north to east', () {
    final robot = Robot(Position(0, 0), Orientation.north);
    robot.move('R');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.east);
  }, skip: true);

  test('changes east to south', () {
    final robot = Robot(Position(0, 0), Orientation.east);
    robot.move('R');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.south);
  }, skip: true);

  test('changes south to west', () {
    final robot = Robot(Position(0, 0), Orientation.south);
    robot.move('R');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.west);
  }, skip: true);

  test('changes west to north', () {
    final robot = Robot(Position(0, 0), Orientation.west);
    robot.move('R');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.north);
  }, skip: true);
}

void rotatingCounterClockwise() {
  test('changes north to west', () {
    final robot = Robot(Position(0, 0), Orientation.north);
    robot.move('L');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.west);
  }, skip: true);

  test('changes west to south', () {
    final robot = Robot(Position(0, 0), Orientation.west);
    robot.move('L');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.south);
  }, skip: true);

  test('changes south to east', () {
    final robot = Robot(Position(0, 0), Orientation.south);
    robot.move('L');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.east);
  }, skip: true);

  test('changes east to north', () {
    final robot = Robot(Position(0, 0), Orientation.east);
    robot.move('L');
    expected(robot, beAt: Position(0, 0), faceTo: Orientation.north);
  }, skip: true);
}

void movingForwardOne() {
  test('facing north increments Y', () {
    final robot = Robot(Position(0, 0), Orientation.north);
    robot.move('A');
    expected(robot, beAt: Position(0, 1), faceTo: Orientation.north);
  }, skip: true);

  test('facing south decrements Y', () {
    final robot = Robot(Position(0, 0), Orientation.south);
    robot.move('A');
    expected(robot, beAt: Position(0, -1), faceTo: Orientation.south);
  }, skip: true);

  test('facing east increments X', () {
    final robot = Robot(Position(0, 0), Orientation.east);
    robot.move('A');
    expected(robot, beAt: Position(1, 0), faceTo: Orientation.east);
  }, skip: true);

  test('facing west decrements X', () {
    final robot = Robot(Position(0, 0), Orientation.west);
    robot.move('A');
    expected(robot, beAt: Position(-1, 0), faceTo: Orientation.west);
  }, skip: true);
}

void followSeriesOfInstructions() {
  test('moving east and north from README', () {
    final robot = Robot(Position(7, 3), Orientation.north);
    robot.move('RAALAL');
    expected(robot, beAt: Position(9, 4), faceTo: Orientation.west);
  }, skip: true);

  test('moving west and north', () {
    final robot = Robot(Position(0, 0), Orientation.north);
    robot.move('LAAARALA');
    expected(robot, beAt: Position(-4, 1), faceTo: Orientation.west);
  }, skip: true);

  test('moving west and south', () {
    final robot = Robot(Position(2, -7), Orientation.east);
    robot.move('RRAAAAALA');
    expected(robot, beAt: Position(-3, -8), faceTo: Orientation.south);
  }, skip: true);

  test('moving east and north', () {
    final robot = Robot(Position(8, 4), Orientation.south);
    robot.move('LAAARRRALLLL');
    expected(robot, beAt: Position(11, 5), faceTo: Orientation.north);
  }, skip: true);
}
