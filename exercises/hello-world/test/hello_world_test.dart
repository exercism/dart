import "package:test/test.dart";
import "package:hello_world/hello_world.dart";

void main() {
  test("returns \"Hello, World!\"", () {
    expect(new HelloWorld().hello(), equals("Hello, World!"));
  });
}
