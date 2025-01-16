import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/catagories_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details.dart';
import 'package:food_delivery/widgets/food_griditem.dart';
import 'package:food_delivery/widgets/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> topbannerList = [
    'assets/images/topbanner/Screenshot 2024-06-21 183221.png',
    'assets/images/topbanner/25654682_food_facebook_cover_33.png',
    'assets/images/topbanner/13003824_food-facebook-cover-20.png'
  ];
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  int chosen = 0;
  late List<FoodItem> filteredfood;
  String? categoryChosenId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredfood = foods;
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Exclusive offers',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            const Divider(
              indent: 0,
              endIndent: 350.0,
              color: Colors.deepOrange,
              thickness: 2,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      carouselController: _controller,
                      itemCount: topbannerList.length,
                      itemBuilder: (context, index, realIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            topbannerList[index],
                            fit: BoxFit.fill,
                            height: isLandScape
                                ? size.height * 0.6
                                : size.height * 0.15,
                            width: double.infinity,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        viewportFraction: 0.9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        autoPlay: true,

                        enlargeCenterPage: true,
                        aspectRatio: 19 / 8,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        // enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: _current,
                        count: topbannerList.length,
                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.deepOrangeAccent,
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20),
                )),
            const Divider(
              indent: 0,
              endIndent: 350.0,
              color: Colors.deepOrange,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: size.height * 0.15,
              child: ListView.builder(
                  itemCount: catagories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            categoryChosenId = catagories[index].id;
                          });
                          filteredfood = foods
                              .where(
                                  (item) => item.catagoryId == categoryChosenId)
                              .toList();
                        },
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: categoryChosenId == catagories[index].id
                                  ? Colors.deepOrange
                                  : themeNotifier.isDarkMode
                                      ? Colors.black26
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(13.0)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: Image.asset(catagories[index].imageUrl),
                              ),
                              Text(
                                catagories[index].title,
                                style: TextStyle(
                                    color:
                                        categoryChosenId == catagories[index].id
                                            ? Colors.white
                                            : null),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredfood.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandScape ? 4 : 2,
                mainAxisSpacing: size.height * 0.02,
                crossAxisSpacing: size.height * 0.02,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FoodDetails(
                            foodItem: foods[index],
                          ))),
                  child: FoodGridItem(
                    foodIndex: index,
                    filteredfood: filteredfood,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
