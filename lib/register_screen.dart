import 'package:app_posy/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCBCB), // Pink sesuai gambar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              
              // --- Header ---
              Text(
                "Silakan Daftar!",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF102C57),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Jika anda belum memiliki akun daftar disini",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF102C57).withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 40),

              // --- Input No HP ---
              _buildLabel("No HP/Whatsapp"),
              const SizedBox(height: 8),
              _buildTextField(hintText: "324218740082930001", isObscure: false),

              const SizedBox(height: 20),

              // --- Input Nama ---
              _buildLabel("Nama"),
              const SizedBox(height: 8),
              _buildTextField(hintText: "Audrey Pramudita S", isObscure: false),

              const SizedBox(height: 20),

              // --- Input Password ---
              _buildLabel("Password"),
              const SizedBox(height: 8),
              _buildTextField(hintText: "*********", isObscure: true),

              const SizedBox(height: 40),

              // --- Tombol Daftar ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Logika pendaftaran
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1679AB), // Biru tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Daftar",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- Tombol Kembali ke Login ---
              Center(
                child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    ),
                  child: RichText(
                    text: TextSpan(
                      text: "Sudah punya akun? ",
                      style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF102C57)),
                      children: [
                        TextSpan(
                          text: "Masuk disini",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1679AB),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper untuk Label
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF102C57),
      ),
    );
  }

  // Widget Helper untuk TextField
  Widget _buildTextField({required String hintText, required bool isObscure}) {
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
        obscureText: isObscure,
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