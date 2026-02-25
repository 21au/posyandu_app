import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kesehatan_anak.dart'; // Pastikan import ini benar sesuai nama filemu

class IdentitasAnakScreen extends StatefulWidget {
  const IdentitasAnakScreen({super.key});

  @override
  State<IdentitasAnakScreen> createState() => _IdentitasAnakScreenState();
}

class _IdentitasAnakScreenState extends State<IdentitasAnakScreen> {
  String _jenisKelamin = "Perempuan";
  DateTime? _selectedDate;
  
  // Controller untuk mengambil teks input
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _tempatLahirController = TextEditingController();
  final TextEditingController _namaIbuController = TextEditingController();
  final TextEditingController _namaAyahController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCBCB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Header Biru Tua ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, left: 10, right: 20, bottom: 40),
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
                  // Tombol Kembali (Hanya pop karena ini halaman form)
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                    label: Text(
                      "Kembali",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Data Anak",
                            style: GoogleFonts.poppins(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                        Text("Lengkapi identitas si kecil",
                            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- Form Identitas Anak ---
            _buildCardForm(
              title: "Identitas Anak",
              children: [
                _buildLabel("Nama Lengkap Anak *"),
                _buildTextField("Contoh: Aisyah Putri", controller: _namaController),
                const SizedBox(height: 15),
                _buildLabel("Jenis Kelamin *"),
                Row(
                  children: [
                    Expanded(child: _buildGenderButton("Perempuan", "👧")),
                    const SizedBox(width: 10),
                    Expanded(child: _buildGenderButton("Laki-laki", "👦")),
                  ],
                ),
                const SizedBox(height: 15),
                _buildLabel("Tanggal Lahir *"),
                TextField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: GoogleFonts.poppins(color: const Color(0xFF102C57)),
                  decoration: _inputStyle("dd/mm/yyyy", Icons.calendar_today),
                ),
                const SizedBox(height: 15),
                _buildLabel("Tempat Lahir *"),
                _buildTextField("Contoh: Jakarta", controller: _tempatLahirController),
              ],
            ),

            // --- Form Data Orang Tua ---
            _buildCardForm(
              title: "Data Orang Tua",
              children: [
                _buildLabel("Nama Ibu *"),
                _buildTextField("Nama lengkap ibu", controller: _namaIbuController),
                const SizedBox(height: 15),
                _buildLabel("Nama Ayah"),
                _buildTextField("Nama lengkap ayah", controller: _namaAyahController),
              ],
            ),

            // --- Form Catatan Tambahan ---
            _buildCardForm(
              title: "Catatan Tambahan",
              subtitle: "(Dapat dikosongkan)",
              children: [
                _buildTextField(
                  "Informasi penting lainnya (alergi, obat, dll)",
                  maxLines: 3,
                  controller: _catatanController,
                ),
              ],
            ),

            // --- Tombol Simpan ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Berpindah ke halaman Kesehatan Anak sambil membawa data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KesehatanAnakScreen(
                          namaAnak: _namaController.text.isEmpty ? "Si Kecil" : _namaController.text,
                          gender: _jenisKelamin,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1679AB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  child: Text("Simpan Data",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- Widget Helpers ---

  Widget _buildCardForm({required String title, String? subtitle, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFCBCB).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFFB1B1), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF102C57))),
            if (subtitle != null)
              Text(subtitle, style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF102C57).withOpacity(0.6))),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: const Color(0xFF102C57))),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.poppins(color: const Color(0xFF102C57)),
      decoration: _inputStyle(hint, null),
    );
  }

  InputDecoration _inputStyle(String hint, IconData? icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(color: const Color(0xFF102C57).withOpacity(0.4), fontSize: 13),
      prefixIcon: icon != null ? Icon(icon, color: const Color(0xFF1679AB)) : null,
      filled: true,
      fillColor: const Color(0xFFFFB1B1).withOpacity(0.3),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFFB1B1))),
    );
  }

  Widget _buildGenderButton(String gender, String emoji) {
    bool isSelected = _jenisKelamin == gender;
    return GestureDetector(
      onTap: () => setState(() => _jenisKelamin = gender),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFB1B1) : const Color(0xFFFFCBCB),
          border: Border.all(color: const Color(0xFF1679AB), width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text("$emoji $gender",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF102C57), fontWeight: isSelected ? FontWeight.bold : FontWeight.w500)),
        ),
      ),
    );
  }
}