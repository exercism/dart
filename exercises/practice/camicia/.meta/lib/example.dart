class Camicia {
  Map<String, dynamic> simulateGame(List<String> playerA, List<String> playerB) {
    int val(String card) {
      switch (card) {
        case 'J':
          return 1;
        case 'Q':
          return 2;
        case 'K':
          return 3;
        case 'A':
          return 4;
        default:
          return 0;
      }
    }

    final List<int> handA = playerA.map(val).toList();
    final List<int> handB = playerB.map(val).toList();

    final List<int> pile = <int>[];
    final Set<String> seen = <String>{};

    String turn = 'A';
    int tricks = 0;
    int cardsPlayed = 0;
    int currentDebt = 0;

    while (true) {
      if (pile.isEmpty) {
        final key = '${handA.join(',')}|${handB.join(',')}|$turn';
        if (seen.contains(key)) {
          return {'status': 'loop', 'tricks': tricks, 'cards': cardsPlayed};
        }
        seen.add(key);
      }

      final activeHand = turn == 'A' ? handA : handB;
      final otherHand = turn == 'A' ? handB : handA;

      if (activeHand.isEmpty) {
        final extraTrick = pile.isEmpty ? 0 : 1;
        return {'status': 'finished', 'tricks': tricks + extraTrick, 'cards': cardsPlayed};
      }

      final currentCard = activeHand.removeAt(0);
      pile.add(currentCard);
      cardsPlayed += 1;

      if (currentCard > 0) {
        currentDebt = currentCard;
        turn = turn == 'A' ? 'B' : 'A';
      } else {
        if (currentDebt > 0) {
          currentDebt -= 1;
          if (currentDebt == 0) {
            otherHand.addAll(pile);
            pile.clear();
            tricks += 1;
            currentDebt = 0;

            if (handA.isEmpty || handB.isEmpty) {
              return {'status': 'finished', 'tricks': tricks, 'cards': cardsPlayed};
            }
            turn = turn == 'A' ? 'B' : 'A';
          }
        } else {
          turn = turn == 'A' ? 'B' : 'A';
        }
      }
    }
  }
}
