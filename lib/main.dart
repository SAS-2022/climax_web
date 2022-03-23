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
        brightness: Brightness.dark,
        primaryColor: Colors.grey[700],
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          bottom: _bottomNavigationBar(),
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
      body: _buildHomePage(),
    );
  }

  Widget _buildHomePage() {
    return TabBarView(controller: _tabController, children: [
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
    ]);
  }

  _bottomNavigationBar() {
    return PreferredSize(
      preferredSize: _size,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 60,
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
