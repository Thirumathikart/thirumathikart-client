import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/constants/intro_constants.dart';
import 'package:thirumathikart_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget carousel(AuthController controller) => Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: PageView(
            controller: controller.pageViewController,
            scrollDirection: Axis.horizontal,
            children: list
                .asMap()
                .entries
                .map((e) => carouselPage(
                    e.value['title']!, e.value['body']!, e.value['img']!))
                .toList(),
          ),
        ),
        Align(
            alignment: const AlignmentDirectional(0, 1),
            child: carouselDots(controller)),
      ],
    );
Widget carouselPage(String title, String body, String img) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
    child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(
            img,
            width: 300,
            height: 250,
          )),
          Flexible(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 10),
                child: Text(
                  body,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ))
        ]));

Widget carouselDots(AuthController controller) => Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: SmoothPageIndicator(
        controller: controller.pageViewController,
        count: 3,
        axisDirection: Axis.horizontal,
        onDotClicked: (i) {
          controller.pageViewController.animateToPage(
            i,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        effect: ExpandingDotsEffect(
          expansionFactor: 2.25,
          spacing: 10,
          radius: 16,
          dotWidth: 10,
          dotHeight: 10,
          dotColor: AppTheme.unSelected,
          activeDotColor: AppTheme.chakra,
          paintStyle: PaintingStyle.fill,
        ),
      ),
    );
