import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_text.dart';
import 'add_menu_page.dart';
import 'menu_detail_page.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  // Data menu disimpan dalam List biasa. Harga disimpan sebagai angka (int).
  final List<Map<String, dynamic>> _daftarMenu = [
    {'nama': 'Nasi Goreng', 'harga': 15000},
    {'nama': 'Ayam Geprek', 'harga': 18000},
    {'nama': 'Mie Goreng', 'harga': 12000},
    {'nama': 'Soto Ayam', 'harga': 16000},
    {'nama': 'Es Teh Manis', 'harga': 5000},
  ];

  Future<void> _bukaTambahMenu() async {
    // Membuka halaman tambah menu dan menunggu data yang dikirim balik.
    final dynamic hasil = await Get.to(() => const AddMenuPage());

    if (hasil is Map<String, dynamic>) {
      setState(() {
        _daftarMenu.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'Menu Kantin',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: CustomText(
              'Daftar menu hari ini',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1B5E20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 88),
              itemCount: _daftarMenu.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> menu = _daftarMenu[index];
                final String nama = menu['nama'] as String;
                final int harga = menu['harga'] as int;

                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    onTap: () {
                      Get.to(() => MenuDetailPage(nama: nama, harga: harga));
                    },
                    leading: const Icon(
                      Icons.restaurant,
                      color: Color(0xFF1B5E20),
                      size: 30,
                    ),
                    title: CustomText(
                      nama,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: CustomText(
                      formatRupiah(harga),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFE65100),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Color(0xFFFF9800),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaTambahMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
