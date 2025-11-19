import 'package:flutter/material.dart';
import 'package:vintage_sports/screens/productlist_form.dart';
import 'package:vintage_sports/widgets/left_drawer.dart';
import 'package:vintage_sports/widgets/product_card.dart';
import 'package:vintage_sports/screens/product_entry_list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  
  final String nama = "Muhammad Haikal"; //nama
  final String npm = "2406424190"; //npm
  final String kelas = "B"; //kelas

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vintage Sports',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black12.withOpacity(0.06),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 10),
                    blurRadius: 30,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temukan Heritage\nSepakbola Disini',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Hi, $nama · $npm · Kelas $kelas',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black.withOpacity(0.6),
                        ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductEntryListPage(),
                            ),
                          );
                        },
                        child: const Text('Semua Produk'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductEntryListPage(),
                            ),
                          );
                        },
                        child: const Text('Produk Saya'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewsFormPage(),
                            ),
                          );
                        },
                        child: const Text('+ Tambah Produk'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            Text(
              'Aksi Cepat',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            GridView.count(
              padding: const EdgeInsets.only(top: 4),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: items.map((ItemHomepage item) {
                return ItemCard(item);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }



}


