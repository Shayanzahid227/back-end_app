// import 'package:flutter/material.dart';
// import 'package:flutter_application_new/core/custom_widgets/buttom_nav_bar.dart';
// import 'package:flutter_application_new/core/widgets/buttom_nav_bar.dart';
// import 'package:flutter_application_new/screens/home_screen/home_screen.dart';
// import 'package:flutter_application_new/screens/search/search_screen.dart';
// import 'package:flutter_application_new/screens/chat/chat_screen.dart';

// import 'package:flutter_application_new/core/constant/colors.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();

//   void _onTabSelected(int index) {
//     setState(() => _selectedIndex = index);
//     _pageController.jumpToPage(index);
//   }

//   final List<Widget> _screens = const [
//     HomeScreen(),
//     SearchScreen(),
//     ChatScreen(chatData: {},),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: _screens,
//       ),
//       bottomNavigationBar: CustomBottomNav(
//         currentIndex: _selectedIndex,
//         onTabSelected: _onTabSelected,
//         primaryColor: primaryColor,
//         whiteColor: whiteColor,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         width: 55,
//         height: 55,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: primaryColor,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 8,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: IconButton(
//           icon: const Icon(Icons.add, size: 32, color: Colors.white),
//           onPressed: () {
//             // Add your FAB action here
//           },
//         ),
//       ),
//     );
//   }
// }
