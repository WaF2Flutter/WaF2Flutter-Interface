import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:msf/utills/colorconfig.dart';
import 'package:msf/utills/responsive.dart';
import 'package:msf/controllers/MenuController.dart';
class Header extends StatelessWidget {
  final Menu_Controller menuController = Get.find<Menu_Controller>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () {
                menuController.openDrawer();
            },
            icon: const Icon(Icons.menu_sharp),
          ),
        if (!Responsive.isMobile(context))
          AutoSizeText(
            "Welcome Admin!",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: secondryColor,
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
                  padding: const EdgeInsets.all(16 * 0.75),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16 / 2,
          ),
          decoration: BoxDecoration(
            color: secondryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white12),
          ),
          child: Row(
            children: [
              const Icon(Icons.account_circle, size: 26),
              const Text("admin1"),
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down_rounded)),
            ],
          ),
        ),
      ],
    );
  }
}
