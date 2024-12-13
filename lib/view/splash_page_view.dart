import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../resources/color_manager.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  final List<String> images = [
    "assets/images/shopping.svg",
    "assets/images/payments.svg",
    "assets/images/developer_activity.svg",
  ];
  final List<String> phrases = [
    // "اكتشف تجربة تسوق لا مثيل لها، حيث الأناقة تلتقي بالإبداع!",
    // "سهولة وأمان في الدفع، لتجربة تسوق بلا قلق.",
    // "دعمك المستمر هو أولويتنا! خدمة عملاء متاحة 24/7.",
    "Discover a shopping experience like no other, where elegance meets creativity!",
    "Ease and security in payment for a worry-free shopping experience.",
    "Your continuous support is our priority! Customer service available 24/7."
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController();
  void goNext() {
    setState(() {
      if (_currentPage < phrases.length - 1) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _currentPage = 0;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
            print("object=========$index");
            print("object=========$_currentPage");
          });
        },
        controller:_pageController ,
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  SvgPicture.asset(
                    images[index],
                    height: 250,
                    width: 250,
                  ),

                  const SizedBox(
                    height: 60,
                  ),

                  Text(phrases[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 24,
                          )
                      ),
                  const SizedBox(
                    height: 140,
                  ),

                  // circle
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: _currentPage == index ? 16 : 12,
                          width: _currentPage == index ? 16 : 12,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? ColorsManager.lightBlue
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.lightBlue,
        onPressed:goNext,
        child:  Text("Skip",style: Theme.of(context).textTheme.titleSmall,),
      ),
    );
  }
}
