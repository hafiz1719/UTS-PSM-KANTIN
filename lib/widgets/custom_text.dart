import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Poppins dipilih karena bentuknya bersih, modern, dan mudah dibaca
// di layar HP. Ukuran serta ketebalan yang bisa diatur membuat gaya teks
// konsisten di seluruh halaman aplikasi kantin mahasiswa.
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black87,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

/// Mengubah angka menjadi format rupiah, contoh: 15000 -> "Rp15.000".
String formatRupiah(int nilai) {
  final String digits = nilai.toString();
  final StringBuffer buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      buffer.write('.');
    }
    buffer.write(digits[i]);
  }
  return 'Rp$buffer';
}
