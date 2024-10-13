import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/views/home/home_screen.dart';
import 'package:ngo_app/views/profile_screen/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0.obs;

  var navScreens = [
    const HomeScreen(),
    const ProfileScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'), // Your app title
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Hamburger icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
      ),
      drawer: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground,
        ),
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                40.heightBox,
                "NGO LOAN".text.size(40).white.fontWeight(FontWeight.w900).fontFamily(bold).make(),
                Column(
                  children: List.generate(
                    drawerStringList.length, // Use the length of drawerStringList
                        (index) {
                      return ListTile(
                        leading: Icon(drawerIconList[index], color: white,size: 24,),
                        title: drawerStringList[index].text.size(20).bold.white.make(),
                        onTap: () {
                        },
                      );
                    },
                  ),
                )
              ]
            ),
          ),
        ),
      ),
      body: Obx(
            () => Column(
          children: [
            Expanded(child: navScreens.elementAt(selectedIndex.value)),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
            () => Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: white,
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.purple,
                  color: darkGrey,
                  tabBorderRadius: 10.0,
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                    GButton(
                      icon: Icons.card_giftcard,
                      text: 'Donation',
                    ),
                    GButton(
                      icon: Icons.pie_chart,
                      text: 'Charts',
                    ),
                  ],
                  selectedIndex: selectedIndex.value,
                  onTabChange: (index) {
                    selectedIndex.value = index; // Update the selected index
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
