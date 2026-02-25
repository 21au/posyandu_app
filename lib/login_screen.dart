import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _ingatkanSaya = false;

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
                "Selamat Datang!",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF102C57),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Pantau tumbuh kembang si kecil dengan mudah.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF102C57).withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 50),

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
              _buildTextField(hintText: "Contoh: 08123456789", isObscure: false),

              const SizedBox(height: 20),

              // --- Input Password ---
              Text(
                "Password",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF102C57),
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField(hintText: "********", isObscure: true),

              const SizedBox(height: 10),

              // --- Ingatkan Saya & Lupa Password ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _ingatkanSaya,
                          activeColor: const Color(0xFF1679AB),
                          onChanged: (value) {
                            setState(() {
                              _ingatkanSaya = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Ingatkan Saya",
                        style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF102C57)),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lupa password ?",
                      style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF102C57)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // --- Tombol Masuk ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Logika login sementara arahkan ke dashboard/identitas
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1679AB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Masuk",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- Tambahan: Belum punya akun? Daftar ---
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun? ",
                      style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF102C57)),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Arahkan ke halaman Register
                      },
                      child: Text(
                        "Daftar disini",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1679AB),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper untuk TextField agar kodenya bersih
  Widget _buildTextField({required String hintText, required bool isObscure}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFA3A3).withOpacity(0.5), // Pink gelap transparan sesuai gambar
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