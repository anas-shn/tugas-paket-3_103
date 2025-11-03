import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home_page.dart';
import '../screens/gallery_page.dart';
import '../screens/services_page.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}

class MainNavigation extends StatelessWidget {
  MainNavigation({super.key});

  final NavigationController controller = Get.put(NavigationController());

  final List<Widget> pages = [
    const HomePage(),
    const GalleryPage(),
    const ServicesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business_center),
              label: 'Services',
            ),
          ],
        ),
      ),
    );
  }
}
