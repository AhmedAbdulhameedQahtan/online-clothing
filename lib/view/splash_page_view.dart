import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:online_clothing/view/home_view.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  void goNext() {
    if (_currentPage < AppStrings.pageViewText.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  goNewPage() {
    var res = Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeView(),
      ),
    );
    print("res===============${res}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        controller: _pageController,
        itemCount: AppStrings.pageViewText.length,
        itemBuilder: (context, index) {
          return Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.all(10),
              color: Theme
                  .of(context)
                  .colorScheme
                  .onSurface,
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  SvgPicture.asset(
                    ImageAssets.pageViewImages[index],
                    height: 250,
                    width: 250,
                  ),

                  const SizedBox(
                    height: 60,
                  ),

                  Text(AppStrings.pageViewText[index],
                      textAlign: TextAlign.center,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
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
                                ? ColorsManager.primary
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
        backgroundColor: ColorsManager.primary,
        onPressed: () {
          _currentPage == AppStrings.pageViewText.length - 1 ? goNewPage() : goNext();
        },
        child: Text("Skip", style: Theme
            .of(context)
            .textTheme
            .titleSmall?.copyWith(color: ColorsManager.white),),
      ),
    );
  }
}
