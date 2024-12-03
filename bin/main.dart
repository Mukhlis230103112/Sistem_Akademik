import 'dart:io';
import '../lib/models/mahasiswa.dart';
import '../lib/models/mata_kuliah.dart';
import '../lib/models/krs.dart';
import '../lib/services/academic_service.dart';

void main() {
  // Input data mahasiswa
  print('=== Input Data Mahasiswa ===');
  stdout.write('Masukkan NIM: ');
  final nim = stdin.readLineSync() ?? '';
  stdout.write('Masukkan Nama: ');
  final nama = stdin.readLineSync() ?? '';
  stdout.write('Masukkan Semester: ');
  final semester = int.tryParse(stdin.readLineSync() ?? '') ?? 1;

  final mahasiswa = Mahasiswa(
    nim: nim, 
    nama: nama, 
    semester: semester
  );

  // Buat KRS
  final krs = KRS(mahasiswa: mahasiswa);

  // Input mata kuliah
  while (true) {
    print('\n=== Input Mata Kuliah ===');
    stdout.write('Masukkan Kode Mata Kuliah (atau ketik "selesai"): ');
    final kode = stdin.readLineSync() ?? '';
    
    if (kode.toLowerCase() == 'selesai') break;

    stdout.write('Masukkan Nama Mata Kuliah: ');
    final nama = stdin.readLineSync() ?? '';
    
    stdout.write('Masukkan Jumlah SKS: ');
    final sks = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    final mataKuliah = MataKuliah(
      kode: kode, 
      nama: nama, 
      sks: sks
    );

    krs.tambahMataKuliah(mataKuliah);
  }

  // Buat layanan akademik
  final academicService = AcademicService(krs: krs);

  // Menu interaktif
  while (true) {
    print('\n=== Sistem Akademik ===');
    print('1. Cetak KRS');
    print('2. Input Nilai');
    print('3. Hitung IPK');
    print('4. Cetak Transkrip');
    print('0. Keluar');

    stdout.write('Pilih opsi: ');
    final pilihan = stdin.readLineSync() ?? '';

    switch (pilihan) {
      case '1':
        krs.cetakKRS();
        break;
      case '2':
        krs.cetakKRS();
        stdout.write('Masukkan kode mata kuliah: ');
        final kode = stdin.readLineSync() ?? '';
        
        final mataKuliah = krs.daftarMataKuliah.firstWhere(
          (mk) => mk.kode == kode,
          orElse: () => throw Exception('Mata kuliah tidak ditemukan')
        );

        stdout.write('Masukkan nilai (0-100): ');
        final nilaiInput = double.tryParse(stdin.readLineSync() ?? '') ?? -1;

        if (nilaiInput < 0 || nilaiInput > 100) {
          print('Nilai harus antara 0-100');
          continue;
        }

        academicService.inputNilai(mataKuliah, nilaiInput);
        print('Nilai berhasil diinput');
        break;
      case '3':
        print('IPK: ${academicService.hitungIPK().toStringAsFixed(2)}');
        break;
      case '4':
        academicService.cetakTranskrip();
        break;
      case '0':
        print('Terima kasih!');
        return;
      default:
        print('Pilihan tidak valid');
    }
  }
}