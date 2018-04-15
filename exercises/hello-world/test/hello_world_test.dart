import 'package:test/test.dart';
import 'package:hello_world/hello_world.dart';

void main() {
  test("Say Hi!", () {
    expect(new HelloWorld().hello(), equals("Hello, World!"));
  });
}
