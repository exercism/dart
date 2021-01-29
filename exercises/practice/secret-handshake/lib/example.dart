class SecretHandshake {
  final _signal = ['wink', 'double blink', 'close your eyes', 'jump'];
  final _reverse = 4;

  bool _isBitset(int position, int number) {
    return ((number >> position) & 1) == 1;
  }

  List<String> commands(int number) {
    List<String> handshake = [];

    for (int index = 0; index < _signal.length; index++) {
      if (_isBitset(index, number)) {
        handshake.add(_signal[index]);
      }
    }

    return _isBitset(_reverse, number) ? handshake.reversed.toList() : handshake;
  }
}
