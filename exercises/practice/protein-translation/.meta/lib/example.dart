class ProteinTranslation {
  static const rna2protein = {
    'AUG': 'Methionine',
    'UUU': 'Phenylalanine',
    'UUC': 'Phenylalanine',
    'UUA': 'Leucine',
    'UUG': 'Leucine',
    'UCU': 'Serine',
    'UCC': 'Serine',
    'UCA': 'Serine',
    'UCG': 'Serine',
    'UAU': 'Tyrosine',
    'UAC': 'Tyrosine',
    'UGU': 'Cysteine',
    'UGC': 'Cysteine',
    'UGG': 'Tryptophan',
    'UAA': 'STOP',
    'UAG': 'STOP',
    'UGA': 'STOP',
  };

  List<String> translate(String rna) {
    var proteins = <String>[];

    while (rna.length >= 3) {
      var codon = rna.substring(0, 3);
      var protein = rna2protein[codon];

      if (protein == null) throw ArgumentError();
      if (protein == 'STOP') {
        rna = '';
        break;
      }

      proteins.add(protein);
      rna = rna.substring(3);
    }

    if (rna.isNotEmpty) throw ArgumentError();
    return proteins;
  }
}
