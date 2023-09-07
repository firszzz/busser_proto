import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:busser_proto/screens/bookings_screen.dart';
import 'package:busser_proto/screens/info_screen.dart';
import 'package:busser_proto/screens/main_screen.dart';
import 'package:busser_proto/screens/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late bool _visible;

  @override
  void initState() {
    super.initState();
    _visible = true;
  }

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController(initialPage: 0);
    final _controller = NotchBottomBarController(index: 0);

    final List<Widget> bottomBarPages = [
      InfoScreen(),
      BookingsScreen(),
      MainScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Busser – Трансфер-Такси"),
        actions: [
          TextButton(onPressed: () {
            setState(() {
              print(_visible);
              _visible = !_visible;
              print(_visible);
            });
          }, child: Text("SWITCH"))
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: _visible,
        child: AnimatedNotchBottomBar(
          key: UniqueKey(),
          showShadow: true,
          showBlurBottomBar: true,
          blurFilterX: 5,
          blurFilterY: 5,
          blurOpacity: 0.1,
          durationInMilliSeconds: 300,
          notchBottomBarController: _controller,
          color: Colors.black,
          showLabel: false,
          notchColor: Colors.black,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.newspaper,
                color: Colors.black87,
              ),
              activeItem: Icon(
                Icons.newspaper,
                color: Colors.black,
              ),
              itemLabel: 'Info',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.list,
                color: Colors.black87,
              ),
              activeItem: Icon(
                Icons.list,
                color: Colors.black,
              ),
              itemLabel: 'Bookings',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.local_taxi,
                color: Colors.black87,
              ),
              activeItem: Icon(
                Icons.local_taxi,
                color: Colors.black,
              ),
              itemLabel: 'Main',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: Colors.black87,
              ),
              activeItem: Icon(
                Icons.person,
                color: Colors.black,
              ),
              itemLabel: 'Profile',
            ),
          ],
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
    );
  }
}
