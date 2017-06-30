class RnaTranscription {
  String toRna(String dna) {
    return dna.split("").map((c) {
      switch (c) {
        case "G":
          return "C";
        case "C":
          return "G";
        case "T":
          return "A";
        case "A":
          return "U";
        default:
          throw new ArgumentError("Invalid input");
      }
    }).join("");
  }
}
