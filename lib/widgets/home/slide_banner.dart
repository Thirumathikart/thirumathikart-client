import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideBanner extends StatelessWidget {
  const SlideBanner({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 230,
      child: Expanded(
        child: Center(
          child: ListView(
            children: [
              CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/banner/banner_1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/banner/banner_2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/banner/banner_3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //4th Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/banner/banner_4.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //5th Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/banner/banner_5.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 230.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
