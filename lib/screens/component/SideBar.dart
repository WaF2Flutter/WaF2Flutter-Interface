import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:msf/controllers/ThemeController.dart';
import 'package:msf/controllers/TranslateController.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Divider(color: Theme.of(context).dividerColor),
            ListTile(
              onTap: () {
                Get.toNamed("/home");
              },
              leading: const Icon(Icons.speed_outlined, color: Colors.white60),
              title: AutoSizeText(
                "Dashboard".tr,
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("/websites");
              },
              leading: const Icon(Icons.web, color: Colors.white60),
              title: AutoSizeText(
                "Websites".tr,
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("/setting");
              },
              leading: const Icon(Icons.settings_sharp, color: Colors.white60),
              title: AutoSizeText(
                "Settings".tr,
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.speed_outlined, color: Colors.white60),
              title: AutoSizeText(
                "Statistics".tr,
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.padding, color: Colors.white60),
              title: AutoSizeText(
                "System Log".tr,
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            //Spacer?
            SizedBox(height: 500,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: AutoSizeText(
                    "Dark Mode".tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Obx(() {
                  return Switch(
                    value: Get.find<ThemeController>().isDark.value,
                    onChanged: (value) {
                      Get.find<ThemeController>().toggle();
                    },
                    activeColor: Theme.of(context).primaryColor,
                  );
                }),
              ],
            ),

            const SizedBox(height: 20), 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: AutoSizeText(
                    "فارسی".tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Obx(() {
                  return Switch(
                    value: Get.find<TranslateController>().isEnglish.value, 
                    onChanged: (value) {
                      Get.find<TranslateController>().changeLang(value ? 'en' : 'fa');
                    },
                    activeColor: Theme.of(context).primaryColor,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}