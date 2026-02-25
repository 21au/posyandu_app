import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LupaPasswordScreen extends StatelessWidget {
  const LupaPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCBCB), // Background Pink
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF102C57)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              
              // --- Judul ---
              Text(
                "Lupa Password?",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF102C57),
                ),
              ),
              const SizedBox(height: 12),
              
              // --- Deskripsi ---
              Text(
                "Jangan khawatir, Bun. Masukkan nomor WhatsApp yang terdaftar untuk mengatur ulang sandi.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF102C57).withOpacity(0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // --- Input No HP ---
              Text(
                "No HP/Whatsapp",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF102C57),
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField(hintText: "324218740082930001"),

              const SizedBox(height: 50),

              // --- Tombol Kirim ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Nantinya akan memanggil fungsi reset password Firebase
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1679AB), // Biru tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Kirim Kode Verifikasi",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper TextField agar konsisten dengan Login & Register
  Widget _buildTextField({required String hintText}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFA3A3).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        style: GoogleFonts.poppins(color: const Color(0xFF102C57)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.black38),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}