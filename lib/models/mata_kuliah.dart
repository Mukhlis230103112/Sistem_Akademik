class MataKuliah {
  final String kode;
  final String nama;
  final int sks;

  MataKuliah({
    required this.kode, 
    required this.nama, 
    required this.sks
  });

  @override
  String toString() {
    return '$kode - $nama ($sks SKS)';
  }
}