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
                  fontWeight: FontWeight.normal))),
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
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          bottom: _bottomNavigationBar(),
          flexibleSpace: const Image(
            image: AssetImage('images/cleaning_image_1.jpeg'),
            fit: BoxFit.cover,
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

  TabBar _bottomNavigationBar() {
    return TabBar(
        labelStyle: Theme.of(context).textTheme.headline2,
        controller: _tabController,
        tabs: [
          //Main Page
          Tab(text: 'Home'),
          //About us
          Tab(text: 'About us'),
          //Gallery
          Tab(text: 'Gallery'),
          //Contact us
          Tab(text: 'Contact us'),
        ]);
  }
}
