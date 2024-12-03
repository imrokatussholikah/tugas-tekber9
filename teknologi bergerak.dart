import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HalamanDepanMahasiswa(),
    );
  }
}

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final String email;
  final String noHp;
  final String hobi;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.email,
    required this.noHp,
    required this.hobi,
  });
}

class HalamanDepanMahasiswa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data mahasiswa yang sudah ditentukan
    final mahasiswa = Mahasiswa(
      nama: 'Imroatus',
      nim: 'F12.2022.00063',
      prodi: 'Sistem Informasi',
      email: 'imroatus@email.com',
      noHp: '082143661711',
      hobi: 'Menulis dan Menonton',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Mahasiswa'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 70, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                mahasiswa.nama,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'NIM: ${mahasiswa.nim}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Prodi: ${mahasiswa.prodi}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilMahasiswa(mahasiswa: mahasiswa),
                    ),
                  );
                },
                child: Text('Lihat Profil Lengkap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilMahasiswa extends StatelessWidget {
  final Mahasiswa mahasiswa;

  ProfilMahasiswa({required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Mahasiswa'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person, size: 70, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      mahasiswa.nama,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildDetailRow(Icons.numbers, 'NIM', mahasiswa.nim),
                    _buildDetailRow(Icons.school, 'Prodi', mahasiswa.prodi),
                    _buildDetailRow(Icons.email, 'Email', mahasiswa.email),
                    _buildDetailRow(Icons.phone, 'No. HP', mahasiswa.noHp),
                    _buildDetailRow(Icons.favorite, 'Hobi', mahasiswa.hobi),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Kembali ke Halaman Utama'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
