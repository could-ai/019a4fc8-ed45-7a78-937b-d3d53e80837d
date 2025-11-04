import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'wiki_screen.dart';

void main() {
  runApp(const RepairPortalApp());
}

class RepairPortalApp extends StatelessWidget {
  const RepairPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Digital Perbaikan Chasis & Body',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0),
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/services': (context) => const ServicesScreen(),
        '/booking': (context) => const BookingScreen(),
        '/tracking': (context) => const TrackingScreen(),
        '/wiki': (context) => const WikiListScreen(), // Added route for Wiki pages
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal Perbaikan Chasis & Body'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang di Portal Digital Perbaikan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Layanan perbaikan chassis dan body kendaraan Anda dengan mudah dan cepat.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(
                    context,
                    'Layanan',
                    Icons.build,
                    '/services',
                    'Lihat daftar layanan perbaikan',
                  ),
                  _buildMenuCard(
                    context,
                    'Pesan Perbaikan',
                    Icons.schedule,
                    '/booking',
                    'Buat janji temu untuk perbaikan',
                  ),
                  _buildMenuCard(
                    context,
                    'Tracking Status',
                    Icons.track_changes,
                    '/tracking',
                    'Pantau status perbaikan Anda',
                  ),
                  _buildMenuCard(
                    context,
                    'Wiki',
                    Icons.book,
                    '/wiki',
                    'Panduan Lengkap Perbaikan',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, String? route, String subtitle) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: route != null ? () => Navigator.pushNamed(context, route) : () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur Kontak akan segera hadir!')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layanan Perbaikan')),
      body: const Center(child: Text('Daftar layanan perbaikan akan ditampilkan di sini.')),
    );
  }
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesan Perbaikan')),
      body: const Center(child: Text('Formulir pemesanan perbaikan akan ditampilkan di sini.')),
    );
  }
}

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tracking Status')),
      body: const Center(child: Text('Status tracking perbaikan akan ditampilkan di sini.')),
    );
  }
}
