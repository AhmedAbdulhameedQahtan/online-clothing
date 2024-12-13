import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> phrases = [
    "اكتشف تجربة تسوق لا مثيل لها، حيث الأناقة تلتقي بالإبداع!",
    "سهولة وأمان في الدفع، لتجربة تسوق بلا قلق.",
    "دعمك المستمر هو أولويتنا! خدمة عملاء متاحة 24/7.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("متجر الملابس"),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return Container(
            color: index % 2 == 0 ? Colors.blue.shade100 : Colors.pink.shade100,
            child: Center(
              child: Text(
                phrases[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
