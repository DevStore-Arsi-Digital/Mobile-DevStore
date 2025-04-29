import 'package:flutter/material.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Temukan & Miliki Aplikasi Impianmu',
      description: 'Solusi digital siap pakai, kepemilikan penuh di tanganmu! Jelajahi berbagai aplikasi berkualitas dari developer terbaik dan miliki tanpa batasan.',
      imagePath: "assets/images/onboarding1.png",
    ),
    OnboardingItem(
      title: 'DevStore – Marketplace Aplikasi Inovatif',
      description: 'Jembatan antara developer dan pembeli aplikasi! Dapatkan aplikasi siap pakai dengan transaksi aman menggunakan Midtrans.',
      imagePath: "assets/images/onboarding2.png" ,
    ),
    OnboardingItem(
      title: 'Platform Aman untuk Jual Beli Aplikasi',
      description: 'Developer menjual, pembeli memiliki sepenuhnya! Beli, jual, dan miliki aplikasi dengan kepemilikan penuh, hanya di DevStore.',
      imagePath: "assets/images/onboarding3.png",
    ),
  ];      

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  void _skipToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _goToNextPage,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _skipToLogin,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _items.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(item: _items[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _items.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? const Color(0xFF1F1D42)
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB388FF),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}