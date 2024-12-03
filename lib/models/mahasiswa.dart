class Mahasiswa {
  final String nim;
  final String nama;
  final int semester;

  Mahasiswa({
    required this.nim, 
    required this.nama, 
    required this.semester
  });

  @override
  String toString() {
    return 'Mahasiswa: $nama (NIM: $nim)';
  }
}