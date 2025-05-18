import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F8),
        appBar: AppBar(
          title: const Text(
            'Pesanan Saya',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero, // Hilangkan padding
              margin: EdgeInsets.zero, // Hilangkan margin
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.deepPurple,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                tabs: const [
                  Tab(text: 'Belum Bayar'),
                  Tab(text: 'Diproses'),
                  Tab(text: 'Diterima'),
                  Tab(text: 'Selesai'),
                  Tab(text: 'Dibatalkan'),
                ],
              ),
            ),
          ),

        ),
        body: const TabBarView(
          children: [
            OrderTabContent(),
            OrderTabContent(),
            OrderTabContent(),
            OrderTabContent(),
            OrderTabContent(),
          ],
        ),
      ),
    );
  }
}

class OrderTabContent extends StatelessWidget {
  const OrderTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/onboarding2.png',
              height: 160,
            ),
            const SizedBox(height: 12),
            const Text(
              'Belum ada pesanan',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          'Rekomendasi Produk',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildProductGrid(),
      ],
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/produk.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("StayAwake", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("IOT", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 4),
                    Text("Rp. 5.000.000", style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
