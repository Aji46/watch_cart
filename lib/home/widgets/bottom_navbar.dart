import 'package:bw2_cart/controller/provider/like_provider.dart'; // Ensure the path is correct
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const BottomNavbar({Key? key}) : preferredSize = const Size.fromHeight(60.0), super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    if (index == 0) {
      context.go('/home');
    } else if (index == 1) {
      context.go('/cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.black : Colors.grey,
              ),
              if (currentIndex == 0)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 30,
                  height: 3,
                      decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomLeft,
              radius: 1.9,
              colors: [
                Color.fromARGB(255, 20, 171, 191),
                Color.fromARGB(255, 151, 244, 64),
              ],
              stops: [0.4, 1.0],
            ),
          ),
                ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              Builder(
                builder: (context) {
                  final likedProductsCount = Provider.of<LikedProductsProvider>(context).likedProductsCount;

                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          onTabTapped(1);
                        },
                        child: Image.asset(
                          'lib/asset/images/pngegg.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              likedProductsCount.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              if (currentIndex == 1)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 30,
                  height: 3,
                     decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomLeft,
              radius: 1.9,
              colors: [
                Color.fromARGB(255, 20, 171, 191),
                Color.fromARGB(255, 151, 244, 64),
              ],
              stops: [0.4, 1.0],
            ),
          ),
                ),
            ],
          ),
          label: '',
        ),
      ],
    );
  }
}
