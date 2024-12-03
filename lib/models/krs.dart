import 'mahasiswa.dart';
import 'mata_kuliah.dart';
import 'nilai.dart';

class KRS {
  final Mahasiswa mahasiswa;
  final List<MataKuliah> daftarMataKuliah = [];
  final List<Nilai> daftarNilai = [];

  KRS({required this.mahasiswa});

  void tambahMataKuliah(MataKuliah mataKuliah) {
    if (!daftarMataKuliah.contains(mataKuliah)) {
      daftarMataKuliah.add(mataKuliah);
    }
  }

  void tambahNilai(Nilai nilai) {
    // Cek apakah mata kuliah ada di KRS
    if (daftarMataKuliah.contains(nilai.mataKuliah)) {
      // Hapus nilai lama jika sudah ada
      daftarNilai.removeWhere((n) => n.mataKuliah == nilai.mataKuliah);
      daftarNilai.add(nilai);
    } else {
      throw Exception('Mata kuliah tidak terdaftar di KRS');
    }
  }

  void cetakKRS() {
    print('===== KRS ${mahasiswa.nama} =====');
    for (var mataKuliah in daftarMataKuliah) {
      print(mataKuliah);
    }
    print('Total SKS: ${hitungTotalSKS()}');
  }

  int hitungTotalSKS() {
    return daftarMataKuliah.fold(0, (total, mk) => total + mk.sks);
  }
}