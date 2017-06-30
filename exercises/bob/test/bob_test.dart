import "package:test/test.dart";
import "package:bob/bob.dart";

void main() {
  final bob = new Bob();

  group("Bob", () {
    test("stating something", () {
      final result = bob.hey("Tom-ay-to, tom-aaaah-to.");

      expect(result, equals("Whatever."));
    });

    test("shouting", () {
      final result = bob.hey("WATCH OUT!");

      expect(result, equals("Whoa, chill out!"));
    }, skip: true);

    test("asking a question", () {
      final result = bob.hey("Does this cryogenic chamber make me look fat?");

      expect(result, equals("Sure."));
    }, skip: true);

    test("talking forcefully", () {
      final result = bob.hey("Let\"s go make out behind the gym!");

      expect(result, equals("Whatever."));
    }, skip: true);

    test("using acronyms in regular speech", () {
      final result = bob.hey("It\"s OK if you don\"t want to go to the DMV.");

      expect(result, equals("Whatever."));
    }, skip: true);

    test("forceful questions", () {
      final result = bob.hey("WHAT THE HELL WERE YOU THINKING?");

      expect(result, equals("Whoa, chill out!"));
    }, skip: true);

    test("shouting numbers", () {
      final result = bob.hey("1, 2, 3 GO!");

      expect(result, equals("Whoa, chill out!"));
    }, skip: true);

    test("only numbers", () {
      final result = bob.hey("1, 2, 3");

      expect(result, equals("Whatever."));
    }, skip: true);

    test("question with only numbers", () {
      final result = bob.hey("4?");

      expect(result, equals("Sure."));
    }, skip: true);

    test("shouting with special characters", () {
      final result = bob.hey("ZOMG THE %^*@#\$(*^ ZOMBIES ARE COMING!!11!!1!");

      expect(result, equals("Whoa, chill out!"));
    }, skip: true);

    test("shouting with umlauts", () {
      /// NOTE:
      ///   \xc4 = Ä
      ///   \xe4 = ä
      ///   \xdc = Ü
      ///   \xfc = ü
      ///
      ///   "\xfcML\xe4\xdcTS" === "üMLäÜTS"

      final result = bob.hey("\xdcML\xc4\xdcTS!");

      expect(result, equals("Whoa, chill out!"));
    }, skip: true);

    test("calmly speaking about umlauts", () {
      final result = bob.hey("\xfcML\xe4\xdcTS");

      expect(result, equals("Whatever."));
    }, skip: true);

    test("shouting with no exclamation mark", () {
      final result = bob.hey("I HATE YOU");

      expect(result, equals("Whoa, chill out!"));
    }, skip: true);

    test("statement containing question mark", () {
      final result = bob.hey("Ending with a ? means a question.");

      expect(result, equals("Whatever."));
    }, skip: true);

    test("prattling on", () {
      final result = bob.hey("Wait! Hang on.  Are you going to be OK?");

      expect(result, equals("Sure."));
    }, skip: true);

    test("silence", () {
      final result = bob.hey("");

      expect(result, equals("Fine. Be that way!"));
    }, skip: true);

    test("prolonged silence", () {
      final result = bob.hey("   ");

      expect(result, equals("Fine. Be that way!"));
    }, skip: true);
  });
}
