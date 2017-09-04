import "package:test/test.dart";
import "package:hello_world/hello_world.dart";

void main() {
  var helloWorld = new HelloWorld();

  test("should work", () {
    helloWorld.hello();
  });

  test("says hello world with no name", () {
    expect(helloWorld.hello(), equals("Hello, World!"));
  }, skip: true);

  test("says hello to bob", () {
    expect(helloWorld.hello("Bob"), equals("Hello, Bob!"));
  }, skip: true);

  test("says hello to sally", () {
    expect(helloWorld.hello("Sally"), equals("Hello, Sally!"));
  }, skip: true);
}
