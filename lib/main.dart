import 'package:climax_web_page/screens/about_us.dart';
import 'package:climax_web_page/screens/contact_us.dart';
import 'package:climax_web_page/screens/gallery.dart';
import 'package:climax_web_page/screens/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Climax Cont & Services',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Size _size;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: AppBar(
                backgroundColor: Colors.white70,
                flexibleSpace: const SizedBox(
                  height: 100,
                  width: 200,
                  child: Image(
                    image: AssetImage('images/climax_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            _buildHomePage(),
            _bottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return Positioned(
      top: _size.height / 4.5,
      child: SizedBox(
        height: 3 * _size.height / 4,
        width: _size.width - 50,
        child: TabBarView(controller: _tabController, children: [
          Center(
            child: MainPage(),
          ),
          Center(
            child: AboutUs(),
          ),
          Center(
            child: Gallery(),
          ),
          Center(
            child: ContactUs(),
          ),
        ]),
      ),
    );
  }

  _bottomNavigationBar() {
    return Positioned(
      top: _size.height / 6.3,
      left: _size.width / 2 - (_size.width / 4),
      child: Container(
        padding: EdgeInsets.all(5),
        height: 40,
        width: _size.width / 2,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(25),
        ),
        child: TabBar(
            labelStyle: Theme.of(context).textTheme.headline2,
            controller: _tabController,
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.white,
            tabs: [
              //Main Page
              Tab(text: 'Home'),
              //About us
              Tab(text: 'About us'),
              //Gallery
              Tab(text: 'Gallery'),
              //Contact us
              Tab(text: 'Contact us'),
            ]),
      ),
    );
  }
}
