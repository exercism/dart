import 'package:relative_distance/relative_distance.dart';
import 'package:test/test.dart';

void main() {
  group('RelativeDistance', () {
    test('Direct parent-child relation', () {
      final familyTree = {
        'Vera': ['Tomoko'],
        'Tomoko': ['Aditi']
      };
      final distance = RelativeDistance(familyTree);
      expect(distance.degreesOfSeparation('Vera', 'Tomoko'), equals(1));
    }, skip: false);

    test('Sibling relationship', () {
      final familyTree = {
        'Dalia': ['Olga', 'Yassin']
      };
      final distance = RelativeDistance(familyTree);
      expect(distance.degreesOfSeparation('Olga', 'Yassin'), equals(1));
    }, skip: true);

    test('Two degrees of separation, grandchild', () {
      final familyTree = {
        'Khadija': ['Mateo'],
        'Mateo': ['Rami']
      };
      final distance = RelativeDistance(familyTree);
      expect(distance.degreesOfSeparation('Khadija', 'Rami'), equals(2));
    }, skip: true);

    test('Unrelated individuals', () {
      final familyTree = {
        'Priya': ['Rami'],
        'Kaito': ['Elif']
      };
      final distance = RelativeDistance(familyTree);
      expect(distance.degreesOfSeparation('Priya', 'Kaito'), equals(-1));
    }, skip: true);

    test('Complex graph, cousins', () {
      final familyTree = {
        "Aiko": ["Bao", "Carlos"],
        "Bao": ["Dalia", "Elias"],
        "Carlos": ["Fatima", "Gustavo"],
        "Dalia": ["Hassan", "Isla"],
        "Elias": ["Javier"],
        "Fatima": ["Khadija", "Liam"],
        "Gustavo": ["Mina"],
        "Hassan": ["Noah", "Olga"],
        "Isla": ["Pedro"],
        "Javier": ["Quynh", "Ravi"],
        "Khadija": ["Sofia"],
        "Liam": ["Tariq", "Uma"],
        "Mina": ["Viktor", "Wang"],
        "Noah": ["Xiomara"],
        "Olga": ["Yuki"],
        "Pedro": ["Zane", "Aditi"],
        "Quynh": ["Boris"],
        "Ravi": ["Celine"],
        "Sofia": ["Diego", "Elif"],
        "Tariq": ["Farah"],
        "Uma": ["Giorgio"],
        "Viktor": ["Hana", "Ian"],
        "Wang": ["Jing"],
        "Xiomara": ["Kaito"],
        "Yuki": ["Leila"],
        "Zane": ["Mateo"],
        "Aditi": ["Nia"],
        "Boris": ["Oscar"],
        "Celine": ["Priya"],
        "Diego": ["Qi"],
        "Elif": ["Rami"],
        "Farah": ["Sven"],
        "Giorgio": ["Tomoko"],
        "Hana": ["Umar"],
        "Ian": ["Vera"],
        "Jing": ["Wyatt"],
        "Kaito": ["Xia"],
        "Leila": ["Yassin"],
        "Mateo": ["Zara"],
        "Nia": ["Antonio"],
        "Oscar": ["Bianca"],
        "Priya": ["Cai"],
        "Qi": ["Dimitri"],
        "Rami": ["Ewa"],
        "Sven": ["Fabio"],
        "Tomoko": ["Gabriela"],
        "Umar": ["Helena"],
        "Vera": ["Igor"],
        "Wyatt": ["Jun"],
        "Xia": ["Kim"],
        "Yassin": ["Lucia"],
        "Zara": ["Mohammed"]
      };
      final distance = RelativeDistance(familyTree);
      expect(distance.degreesOfSeparation('Dimitri', 'Fabio'), equals(9));
    }, skip: true);

    test('Complex graph, no shortcut, far removed nephew', () {
      final familyTree = {
        "Aiko": ["Bao", "Carlos"],
        "Bao": ["Dalia", "Elias"],
        "Carlos": ["Fatima", "Gustavo"],
        "Dalia": ["Hassan", "Isla"],
        "Elias": ["Javier"],
        "Fatima": ["Khadija", "Liam"],
        "Gustavo": ["Mina"],
        "Hassan": ["Noah", "Olga"],
        "Isla": ["Pedro"],
        "Javier": ["Quynh", "Ravi"],
        "Khadija": ["Sofia"],
        "Liam": ["Tariq", "Uma"],
        "Mina": ["Viktor", "Wang"],
        "Noah": ["Xiomara"],
        "Olga": ["Yuki"],
        "Pedro": ["Zane", "Aditi"],
        "Quynh": ["Boris"],
        "Ravi": ["Celine"],
        "Sofia": ["Diego", "Elif"],
        "Tariq": ["Farah"],
        "Uma": ["Giorgio"],
        "Viktor": ["Hana", "Ian"],
        "Wang": ["Jing"],
        "Xiomara": ["Kaito"],
        "Yuki": ["Leila"],
        "Zane": ["Mateo"],
        "Aditi": ["Nia"],
        "Boris": ["Oscar"],
        "Celine": ["Priya"],
        "Diego": ["Qi"],
        "Elif": ["Rami"],
        "Farah": ["Sven"],
        "Giorgio": ["Tomoko"],
        "Hana": ["Umar"],
        "Ian": ["Vera"],
        "Jing": ["Wyatt"],
        "Kaito": ["Xia"],
        "Leila": ["Yassin"],
        "Mateo": ["Zara"],
        "Nia": ["Antonio"],
        "Oscar": ["Bianca"],
        "Priya": ["Cai"],
        "Qi": ["Dimitri"],
        "Rami": ["Ewa"],
        "Sven": ["Fabio"],
        "Tomoko": ["Gabriela"],
        "Umar": ["Helena"],
        "Vera": ["Igor"],
        "Wyatt": ["Jun"],
        "Xia": ["Kim"],
        "Yassin": ["Lucia"],
        "Zara": ["Mohammed"]
      };
      final distance = RelativeDistance(familyTree);
      expect(distance.degreesOfSeparation('Lucia', 'Jun'), equals(14));
    }, skip: true);

    test(
        'Complex graph, some shortcuts, cross-down and cross-up, cousins several times removed, with unrelated family tree',
        () {
      final familyTree = {
        "Aiko": ["Bao", "Carlos"],
        "Bao": ["Dalia"],
        "Carlos": ["Fatima", "Gustavo"],
        "Dalia": ["Hassan", "Isla"],
        "Fatima": ["Khadija", "Liam"],
        "Gustavo": ["Mina"],
        "Hassan": ["Noah", "Olga"],
        "Isla": ["Pedro"],
        "Javier": ["Quynh", "Ravi"],
        "Khadija": ["Sofia"],
        "Liam": ["Tariq", "Uma"],
        "Mina": ["Viktor", "Wang"],
        "Noah": ["Xiomara"],
        "Olga": ["Yuki"],
        "Pedro": ["Zane", "Aditi"],
        "Quynh": ["Boris"],
        "Ravi": ["Celine"],
        "Sofia": ["Diego", "Elif"],
        "Tariq": ["Farah"],
        "Uma": ["Giorgio"],
        "Viktor": ["Hana", "Ian"],
        "Wang": ["Jing"],
        "Xiomara": ["Kaito"],
        "Yuki": ["Leila"],
        "Zane": ["Mateo"],
        "Aditi": ["Nia"],
        "Boris": ["Oscar"],
        "Celine": ["Priya"],
        "Diego": ["Qi"],
        "Elif": ["Rami"],
        "Farah": ["Sven"],
        "Giorgio": ["Tomoko"],
        "Hana": ["Umar"],
        "Ian": ["Vera"],
        "Jing": ["Wyatt"],
        "Kaito": ["Xia"],
        "Leila": ["Yassin"],
        "Mateo": ["Zara"],
        "Nia": ["Antonio"],
        "Oscar": ["Bianca"],
        "Priya": ["Cai"],
        "Qi": ["Dimitri"],
        "Rami": ["Ewa"],
        "Sven": ["Fabio"],
        "Tomoko": ["Gabriela"],
        "Umar": ["Helena"],
        "Vera": ["Igor"],
        "Wyatt": ["Jun"],
        "Xia": ["Kim"],
        "Yassin": ["Lucia"],
        "Zara": ["Mohammed"]
      };
      final distance = RelativeDistance(familyTree);
      expect(distance.degreesOfSeparation('Wyatt', 'Xia'), equals(12));
    }, skip: true);
  });
}
