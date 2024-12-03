import 'mata_kuliah.dart';

class Nilai {
  final MataKuliah mataKuliah;
  final double nilaiAngka;

  Nilai({
    required this.mataKuliah, 
    required this.nilaiAngka
  });

  String get nilaiHuruf {
    if (nilaiAngka >= 85) return 'A';
    if (nilaiAngka >= 80) return 'B+';
    if (nilaiAngka >= 75) return 'B';
    if (nilaiAngka >= 70) return 'C+';
    if (nilaiAngka >= 60) return 'C';
    if (nilaiAngka >= 55) return 'D';
    return 'E';
  }

  double get nilaiMutu {
    switch (nilaiHuruf) {
      case 'A': return 4.0;
      case 'B+': return 3.5;
      case 'B': return 3.0;
      case 'C+': return 2.5;
      case 'C': return 2.0;
      case 'D': return 1.0;
      default: return 0.0;
    }
  }

  @override
  String toString() {
    return '${mataKuliah.nama}: $nilaiHuruf (${nilaiAngka.toStringAsFixed(2)})';
  }
}