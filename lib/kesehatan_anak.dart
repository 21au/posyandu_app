import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'identitas_anak.dart'; 

class KesehatanAnakScreen extends StatelessWidget {
  final String namaAnak;
  final String gender;

  const KesehatanAnakScreen({
    super.key,
    required this.namaAnak,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCBCB), // Pink Muda
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Header Biru Tua ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
              decoration: const BoxDecoration(
                color: Color(0xFF102C57), 
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kesehatan Anak", 
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  Text("Pantau tumbuh kembang si kecil", 
                    style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14)),
                  
                  const SizedBox(height: 25),
                  
                  // --- Card Profil Anak (Sesuai Gambar) ---
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.face, color: Color(0xFF102C57)),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(namaAnak, 
                                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text("$gender • Lahir 15 Agustus 2024", 
                                    style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12)),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const IdentitasAnakScreen()),
                                );
                              },
                              icon: const Icon(Icons.edit_outlined, color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Divider(color: Colors.white24),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildHeaderStat("Usia", "18 bulan"),
                            _buildHeaderStat("Berat", "10.0 kg"),
                            _buildHeaderStat("Tinggi", "80 cm"),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- Status Pertumbuhan (Badge Biru) ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF1679AB), 
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Text("Status Pertumbuhan", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Pertumbuhan $namaAnak normal dan sesuai dengan kurva pertumbuhan WHO. Terus berikan nutrisi seimbang!",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            // --- Prediksi Status Gizi (Sesuai Gambar) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timeline, color: Color(0xFFFFB1B1)),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Prediksi Status Gizi", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF102C57))),
                            Text("Berdasarkan data terbaru", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        _buildProphetStat("Usia Anak", "18 bulan"),
                        const SizedBox(width: 40),
                        _buildProphetStat("Indeks Massa Tubuh", "15.6"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("Status Gizi", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1679AB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Normal", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 25),
                    // Rekomendasi
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F1F5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.balance, color: Color(0xFF1679AB), size: 18),
                              const SizedBox(width: 8),
                              Text("Rekomendasi", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: const Color(0xFF102C57))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Pertumbuhan anak sangat baik! Terus berikan nutrisi seimbang dan pantau perkembangannya secara rutin. Pastikan asupan protein, vitamin, dan mineral tercukupi.",
                            style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF102C57), height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- Grafik Berat Badan ---
            const SizedBox(height: 20),
            _buildInfoCard(
              title: "Grafik Berat Badan",
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFCBCB).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFFFFB1B1).withOpacity(0.5)),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomPaint(
                            size: const Size(double.infinity, 200),
                            painter: GridPainter(),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Grafik akan muncul otomatis\nsetelah model Machine Learning aktif",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 11, 
                              color: const Color(0xFF102C57).withOpacity(0.5),
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegend(Colors.blue, "Berat"),
                      const SizedBox(width: 15),
                      _buildLegend(const Color(0xFF102C57), "WHO"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- Helpers ---
  Widget _buildHeaderStat(String label, String value) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12)),
        Text(value, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildProphetStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
        Text(value, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF102C57))),
      ],
    );
  }

  Widget _buildInfoCard({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF102C57))),
            const SizedBox(height: 15),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 5),
        Text(text, style: GoogleFonts.poppins(fontSize: 10, color: const Color(0xFF102C57))),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFFFFB1B1).withOpacity(0.5)
      ..strokeWidth = 1;
    for (var i = 0; i <= 5; i++) {
      double y = size.height - (i * (size.height / 5));
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}