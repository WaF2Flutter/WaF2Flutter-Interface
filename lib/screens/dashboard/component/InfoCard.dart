import 'package:flutter/material.dart';
import 'package:msf/data/data.dart';
import 'package:msf/main.dart';
import 'package:auto_size_text/auto_size_text.dart';

class InfoCards extends StatelessWidget {
  final CloudInfo info;

  InfoCards({
    required this.info,
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
                  color: info.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  info.icon,
                  color: info.color,
                ),
              ),
              Icon(Icons.more_vert_sharp),
            ],
          ),
          AutoSizeText(
            info.title,
            maxLines: 1,
          ),
//This is for example Progress Bar that we need to deploy it later...
//For now lets fill it with some ah canvas??
          ProgressBar(
            info: info,
            color: info.color,
            percentage: info.percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfFiles}",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              Text(
                info.totalStorage,
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
    required this.info,
  });

  final CloudInfo info;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: info.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
