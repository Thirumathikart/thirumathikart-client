import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_app/constants/banner_constants.dart';

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
                  items: data
                      .map((e) => Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(e),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 230.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
