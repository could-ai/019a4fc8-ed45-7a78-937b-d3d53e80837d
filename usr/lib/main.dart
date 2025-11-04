import 'package:flutter/material.dart';

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
                    'Kontak',
                    Icons.contact_mail,
                    null,
                    'Hubungi kami untuk informasi',
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

  final List<Map<String, String>> services = const [
    {'name': 'Perbaikan Chassis', 'description': 'Perbaikan rangka kendaraan untuk keselamatan maksimal.'},
    {'name': 'Perbaikan Body', 'description': 'Restorasi dan perbaikan bodi kendaraan.'},
    {'name': 'Cat Ulang', 'description': 'Layanan pengecatan ulang untuk tampilan baru.'},
    {'name': 'Penggantian Sparepart', 'description': 'Penggantian komponen chassis dan body dengan sparepart berkualitas.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layanan Perbaikan')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(service['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(service['description']!),
              trailing: const Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _vehicle = '';
  String _service = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesan Perbaikan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Anda'),
                validator: (value) => value!.isEmpty ? 'Nama wajib diisi' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kendaraan (contoh: Toyota Avanza)'),
                validator: (value) => value!.isEmpty ? 'Kendaraan wajib diisi' : null,
                onSaved: (value) => _vehicle = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Jenis Layanan'),
                validator: (value) => value!.isEmpty ? 'Layanan wajib diisi' : null,
                onSaved: (value) => _service = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pemesanan berhasil! Kami akan menghubungi Anda segera.')),
                    );
                  }
                },
                child: const Text('Pesan Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  final List<Map<String, String>> repairs = const [
    {'id': '001', 'status': 'Sedang Diproses', 'description': 'Perbaikan chassis selesai, menunggu cat ulang.'},
    {'id': '002', 'status': 'Selesai', 'description': 'Perbaikan body dan sparepart telah selesai.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tracking Status Perbaikan')),
      body: ListView.builder(
        itemCount: repairs.length,
        itemBuilder: (context, index) {
          final repair = repairs[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('ID Perbaikan: ${repair['id']}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${repair['status']} - ${repair['description']}'),
            ),
          );
        },
      ),
    );
  }
}
