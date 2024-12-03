import '../models/krs.dart';
import '../models/mata_kuliah.dart';
import '../models/nilai.dart';

class AcademicService {
  final KRS krs;

  AcademicService({required this.krs});

  void inputNilai(MataKuliah mataKuliah, double nilaiAngka) {
    final nilai = Nilai(
      mataKuliah: mataKuliah, 
      nilaiAngka: nilaiAngka
    );
    krs.tambahNilai(nilai);
  }

  double hitungIPK() {
    if (krs.daftarNilai.isEmpty) {
      return 0.0;
    }

    double totalNilaiMutu = 0.0;
    int totalSKS = 0;

    for (var nilai in krs.daftarNilai) {
      totalNilaiMutu += (nilai.nilaiMutu * nilai.mataKuliah.sks);
      totalSKS += nilai.mataKuliah.sks;
    }

    return totalNilaiMutu / totalSKS;
  }

  void cetakTranskrip() {
    print('===== Transkrip Nilai ${krs.mahasiswa.nama} =====');
    for (var nilai in krs.daftarNilai) {
      print('${nilai.mataKuliah.nama}: '
             '${nilai.nilaiHuruf} (${nilai.nilaiAngka.toStringAsFixed(2)}) '
             '- ${nilai.mataKuliah.sks} SKS');
    }
    print('IPK: ${hitungIPK().toStringAsFixed(2)}');
  }
}