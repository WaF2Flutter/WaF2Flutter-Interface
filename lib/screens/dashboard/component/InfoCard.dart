import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:msf/utills/colorconfig.dart';

class InfoCards extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final int numOfFiles;
  final int percentage;
  final String totalStorage;

  InfoCards({
    required this.icon,
    required this.title,
    required this.color,
    required this.numOfFiles,
    required this.percentage,
    required this.totalStorage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: secondryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              Icon(Icons.more_vert_sharp),
            ],
          ),
          AutoSizeText(
            title,
            maxLines: 1,
          ),
          ProgressBar(
            color: color,
            percentage: percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$numOfFiles Files".tr,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              Text(
                totalStorage,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final Color color;
  final int percentage;

  const ProgressBar({
    required this.color,
    required this.percentage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
