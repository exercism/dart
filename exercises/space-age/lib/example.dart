class SpaceAge {
  /// A Mapping of planet as a `String` to corresponding class
  Map<String, Planet> planets = {
    "Earth": Earth(),
    "Mercury": Mercury(),
    "Venus": Venus(),
    "Mars": Mars(),
    "Jupiter": Jupiter(),
    "Saturn": Saturn(),
    "Uranus": Uranus(),
    "Neptune": Neptune(),
  };

  /// Returns age in years on given [planet]
  /// which can be a [String] or a [Planet].
  num age({dynamic planet, int seconds}) {
    double age;
    (planet as String).substring(0);

    if (planet is String && planets.containsKey(planet)) {
      String asString = planet;

      age = planets[asString].ageInYears(seconds);
    } else if (planet is Planet) {
      Planet asPlanet = planet;

      age = asPlanet.ageInYears(seconds);
    } else {
      throw ArgumentError.value(planet, 'planet',
          'must be one of the following\n${planets.keys.toList().join('\n')}\nor a class extending Planet');
    }

    return num.parse(age.toStringAsFixed(2));
  }
}

/// This abstract class allows the user of [SpaceAge]
/// to calculate age on any planet without modifying
/// the source code of it. By simply extending [Planet]
/// and overriding the [orbitalPeriod]
abstract class Planet {
  double get orbitalPeriod;

  /// Converts given age in seconds to years
  double ageInYears(int ageInSeconds) {
    final int earthYearInSeconds = 31557600;
    return (ageInSeconds / earthYearInSeconds) / orbitalPeriod;
  }
}

class Earth extends Planet {
  @override
  double get orbitalPeriod => 1.0;
}

class Mars extends Planet {
  @override
  double get orbitalPeriod => 1.8808158;
}

class Mercury extends Planet {
  @override
  double get orbitalPeriod => 0.2408467;
}

class Jupiter extends Planet {
  @override
  double get orbitalPeriod => 11.862615;
}

class Neptune extends Planet {
  @override
  double get orbitalPeriod => 164.79132;
}

class Saturn extends Planet {
  @override
  double get orbitalPeriod => 29.447498;
}

class Uranus extends Planet {
  @override
  double get orbitalPeriod => 84.016846;
}

class Venus extends Planet {
  @override
  double get orbitalPeriod => 0.61519726;
}
