import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HalamanHitung(),
    );
  }
}

class HalamanHitung extends StatefulWidget {
  const HalamanHitung({super.key});

  @override
  State<HalamanHitung> createState() => _HalamanHitungState();
}

class _HalamanHitungState extends State<HalamanHitung> {
  final TextEditingController panjangController = TextEditingController();

  final TextEditingController lebarController = TextEditingController();

  double hasil = 0;

  void hitungLuas() {
    double panjang = double.tryParse(panjangController.text) ?? 0;

    double lebar = double.tryParse(lebarController.text) ?? 0;

    setState(() {
      hasil = panjang * lebar;
    });
  }

  @override
  void dispose() {
    panjangController.dispose();
    lebarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Luas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Panjang',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Lebar',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungLuas,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 20),
            Text(
              'Hasil: $hasil',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
