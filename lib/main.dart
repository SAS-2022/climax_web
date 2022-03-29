import 'package:climax_web_page/screens/about_us.dart';
import 'package:climax_web_page/screens/contact_us.dart';
import 'package:climax_web_page/screens/gallery.dart';
import 'package:climax_web_page/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
  bool _showLogo1 = false;
  bool _showLogo2 = false;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showLogo1 = true;
        });
      }
    });
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showLogo2 = true;
        });
      }
    });
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
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: _size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          height: _size.height / 6,
                          width: _size.width / 5,
                          top: _showLogo1 ? 30 : -200,
                          left: 100,
                          duration: Duration(seconds: 4),
                          curve: Curves.elasticInOut,
                          child: const Image(
                              image: AssetImage('images/logo/ccs_logo-03.png'),
                              fit: BoxFit.fill),
                        ),
                        Positioned(
                          height: _size.height / 4,
                          width: _size.width * 0.4,
                          top: 6,
                          left: (_size.width / 2) - (_size.width * 0.4 / 2),
                          child: AnimatedOpacity(
                            opacity: _showLogo2 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 750),
                            child: FadeInImage.memoryNetwork(
                              fadeInDuration: Duration(seconds: 4),
                              fadeInCurve: Curves.slowMiddle,
                              placeholder: kTransparentImage,
                              image: 'images/logo/ccs_logo-02.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
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
      top: _size.height / 3.5,
      child: SizedBox(
        height: _size.height * 0.73,
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
      top: _size.height / 4.2,
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
