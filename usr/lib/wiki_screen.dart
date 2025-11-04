import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

// Define the list of wiki pages with titles and markdown content
final List<Map<String, String>> wikiPages = [
  {
    'title': 'Halaman Utama (Homepage)',
    'content': '''# Bengkel Digital: Panduan Lengkap Body Repair Berbasis Rekayasa

**Pernyataan Misi**
Portal digital ini berfungsi sebagai sumber pengetahuan komprehensif yang menjembatani teori otomotif dengan prosedur perbaikan praktis sesuai standar industri dan akademis. Misi utama adalah memastikan setiap proses perbaikan tidak hanya estetis namun juga memulihkan fungsi keselamatan pasif kendaraan, berdasarkan akurasi dimensi sasis seperti penelitian kerusakan tabrakan.

## Pilar-Prosedur Perbaikan Berbasis Rekayasa
1. Langkah-langkah saling bergantung dalam proses perbaikan bodi.
2. Pencampuran dempul sesuai rasio stoikiometri kritis.
3. Analisis kegagalan prosedural untuk mencegah catastrophic failure.
'''  },
  {
    'title': 'Halaman 1: Investigasi Kerusakan & Analisis Struktural',
    'content': '''# Investigasi Kerusakan & Analisis Struktural

## 1.1 Klasifikasi Tipe Kerusakan
| Tipe Kerusakan | Karakteristik | Dampak |
|---|---|---|
| Kosmetik | Goresan, penyok minor, korosi permukaan. | Estetika panel luar. |
| Struktural | Deformasi sasis/pilar bodi. | Mengurangi kemampuan pasif safety. |

## 1.2 Analisis Tingkat Keparahan
Diagnostik Von Mises Stress, Charpy Test untuk menentukan permanen disrupt.

## 1.3 Prosedur Pengukuran Dimensi
- Sistem 3D terkomputerisasi & multi-point pulling.
- Toleransi deviasi ≤ 3mm dari spesifikasi pabrikan.
'''  },
  {
    'title': 'Halaman 2: Proses Awal Perbaikan (Metal Works)',
    'content': '''# Proses Awal Perbaikan: Metal Works & Stress Management

## 2.1 Pre-Repair Disassembly
Lepas lampu, handle, moulding untuk akses presisi dan hindari overspray.

## 2.2 Teknik Reshaping Mekanis
- **Ketok Magic (PDR)**: Hammer & dolly untuk penyok minor.
- **Panel Pulling**: Dent puller/washer welder untuk penyok dalam.

## 2.3 Metal Shrinking
Menghilangkan tegangan internal dengan panas terkontrol untuk stabilisasi.

## 2.4 Pengelasan Bodi
MIG/TIG dengan kontrol input panas short-circuit/pulsed mode untuk minim HAZ.
'''  },
  {
    'title': 'Halaman 3: Seni Membentuk Permukaan & Lapisan Dasar',
    'content': '''# Seni Membentuk Permukaan & Lapisan Dasar

## 3.1 Body Filler (Dempul)
- Polyester + hardener di-ratio 2-3% by weight.
- Homogen mixing untuk hindari spotting/noda.

## 3.2 Pengamplasan Kering
- Wajib sanding kering (P80 → P150 → P240 → P400).
- Gunakan sanding guide powder.

## 3.3 Epoxy Primer
- Primer Epoksi 2K anti-korosi non-porous.
- Hambatan flash rust & kelembaban.
'''  },
  {
    'title': 'Halaman 4: Pengecatan & Finishing',
    'content': '''# Pengecatan & Finishing: The Final Touch

## 4.1 Spray Booth
- Kontrol partikel, suhu, RH (50-70%).

## 4.2 Basecoat & Clear Coat
- Basecoat warna, diikuti clear coat untuk kilau & proteksi.

## 4.3 Polishing & QC Visual
- Wet sanding P1500→P3000, polishing, wax/sealant.
- QC dengan lampu khusus deteksi swirl marks.
'''  },
  {
    'title': 'Halaman 5: Studi Kasus',
    'content': '''# Studi Kasus: Honda Brio Penyok

**Kerusakan**: Level 2, panel pintu non-struktural.

**Alur Kerja (12 Langkah)**:
1. Bongkar moldings, amplas P80.
2. Panel pulling restoration.
3. Metal shrinking.
4. Finishing manual hammer.
5. Body filler (2-3% hardener).
6. Dry sanding (P80→P150→P240).
7. Epoxy primer 2K.
8. Primer surfacer & final sanding P400.
9. Spray booth control RH.
10. Basecoat & clear coat.
11. Curing dikontrol.
12. Polishing & color blending.
'''  },
];

class WikiListScreen extends StatelessWidget {
  const WikiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panduan Body Repair Wiki')),
      body: ListView.builder(
        itemCount: wikiPages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(wikiPages[index]['title']!),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WikiDetailScreen(
                    title: wikiPages[index]['title']!,
                    content: wikiPages[index]['content']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WikiDetailScreen extends StatelessWidget {
  final String title;
  final String content;
  const WikiDetailScreen({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Markdown(
        data: content,
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
      ),
    );
  }
}
