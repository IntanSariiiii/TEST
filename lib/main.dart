import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yummy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'How To Make Perfect Drinks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Tambahkan navigasi kembali di sini
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: _buildRecipeCard(
                      title: 'LEMON TEA SERIES',
                      rating: 4.9,
                      time: '5 mnt',
                      price: '350 rb',
                      sellerName: 'TIGER SUGAR OFFICIAL',
                      sellerImage: 'assets/image/LOGOTIGERSUGAR.jpg',
                      isVerified: true,
                      imageUrl: 'assets/image/LEMONTEASERIES.jpg',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: _buildRecipeCard(
                      title: 'JAPANESE MOCHI TEA LATTE',
                      rating: 4.8,
                      time: '7 mnt',
                      price: '150 rb',
                      sellerName: 'TIGER SUGAR OFFICIAL',
                      sellerImage: 'assets/image/LOGOTIGERSUGAR.jpg',
                      isVerified: true,
                      imageUrl: 'assets/image/JAPANESEMOCHITEALATTE.jpg',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Flexible(
                    child: _buildRecipeCard(
                      title: 'REAL TARO BOBA MILK',
                      rating: 4.8,
                      time: '3 mnt',
                      price: '200 rb',
                      sellerName: 'TIGER SUGAR OFFICIAL',
                      sellerImage: 'assets/image/LOGOTIGERSUGAR.jpg',
                      isVerified: true,
                      imageUrl: 'assets/image/REALTAROBOBAMILK.jpg',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: _buildRecipeCard(
                      title: 'READ BEAN BOBA MILK',
                      rating: 5.0,
                      time: '7 mnt',
                      price: '450 rb',
                      sellerName: 'TIGER SUGAR OFFICIAL',
                      sellerImage: 'assets/image/LOGOTIGERSUGAR.jpg',
                      isVerified: true,
                      imageUrl: 'assets/image/READBEANBOBAMILK.jpg',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeCard({
    required String title,
    required double rating,
    required String time,
    required String price,
    required String sellerName,
    required String sellerImage,
    required bool isVerified,
    required String imageUrl,
  }) {
    return Card(
      color: const Color.fromARGB(255, 255, 235, 235),
      elevation: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(sellerImage),
                  radius: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  sellerName,
                  style: const TextStyle(fontSize: 7.0, fontWeight: FontWeight.bold),
                ),
              const Spacer(),
              if (isVerified)
                Container(
                  padding: const EdgeInsets.all(2.0), // Padding untuk memberikan efek lingkaran
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue, // Warna latar belakang
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 7.0), // Ikon centang putih
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 160.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    Text('$rating'),
                    const SizedBox(width: 16.0),
                    const Icon(Icons.timer, color: Colors.grey),
                    Text(time),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye, color: Colors.grey, size: 16.0), // Ikon yang diperbarui
                        const SizedBox(width: 4.0),
                        Text(price),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.bookmark_border, color: Colors.black, size: 24.0),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$title bookmarked!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

