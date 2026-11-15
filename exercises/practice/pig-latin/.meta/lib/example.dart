String translate(String phrase) =>
    phrase.replaceAllMapped(RegExp(r'\S+'), translateMatch);

/* These regexes all capture a leading prefix and the rest of the string.
 * The pig-latin-ized translation is "{rest}{prefix}ay"
 */
final q = RegExp(r'^([^aeiou]?qu)(.*)');
final y = RegExp(r'^([^aeiou]+)(y.*)');
final consonants = RegExp(r'^([^aeiou]+)(.*)');
// for this one, the prefix is empty
final vowel = RegExp(r'^()((?:[aeiou]|xr|yt).*)');

final re = [vowel, q, y, consonants]; // use this order

String translateMatch(Match match) {
  var word = match[0]!;
  for (var r in re) {
    var m = r.firstMatch(word);
    if (m != null) {
      return '${m[2]!}${m[1]!}ay';
    }
  }

  // are there other cases?
  return '${word}ay';
}
