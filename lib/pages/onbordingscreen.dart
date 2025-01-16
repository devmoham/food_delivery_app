import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/onbording.dart';
import 'package:food_delivery/pages/bottom_navbar.dart';
import 'package:food_delivery/pages/login_page.dart';
import 'package:food_delivery/widgets/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(
              bottom: 80,
            ),
            color: themeNotifier.isDarkMode ? Colors.black45 : Colors.white,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 2);
              },
              itemCount: onbording.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(onbording[index].imageUrl),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      onbording[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Text(
                        onbording[index].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.only(bottom: 40, right: 10, left: 10),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50)),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 10, left: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.deepOrange,
                ),
                // margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 40),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => controller.jumpToPage(2),
                        child: const Text(
                          'SKIP',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: onbording.length,
                        effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 16,
                            dotColor: Colors.black26,
                            activeDotColor: Colors.white),
                      ),
                    ),
                    TextButton(
                        onPressed: () => controller.nextPage(
                            duration: Duration(microseconds: 150),
                            curve: Curves.bounceInOut),
                        child: const Text(
                          'NEXT',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
