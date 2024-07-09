import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    // ignore: use_super_parameters
    MyHomePage({Key? key}) : super(key: key);
    final List<TrackerItem> items = [
    TrackerItem("Lihat Buku", Icons.library_books_rounded),
    TrackerItem("Tambah Buku", Icons.library_add_rounded),
    TrackerItem("Logout", Icons.logout),
];

    @override
    Widget build(BuildContext context) {
        
    return Scaffold(
            appBar: AppBar(
            title: const Text(
                'Book Tracker',
            ),
            ),
            body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                    const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                        'PBP\'s Tracker', // Text yang menandakan tracker
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    ),
                    // Grid layout
                    GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((TrackerItem item) {
                        // Iterasi untuk setiap item
                        return TrackerCard(item);
                    }).toList(),
                    ),
                ],
                ),
            ),
            ),
        );
        }
}

class TrackerItem {
    final String name;
    final IconData icon;

    TrackerItem(this.name, this.icon);
}

class TrackerCard extends StatelessWidget {
    final TrackerItem item;

    const TrackerCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
    return Material(
        color: Colors.indigo,
        child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                ),
                ],
            ),
            ),
        ),
        ),
    );
    }
}