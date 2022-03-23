import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Size _size;
  bool _expandServices = false;
  bool _expandVision = false;
  bool _expandProjects = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _expandServices = true;
        });
      }
    });
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _expandVision = true;
        });
      }
    });
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _expandProjects = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    //this will be the content of the home page
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: _size.width,
          height: _size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Our service
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: _size.height / 4,
                  child: Stack(
                    children: [
                      //Title
                      AnimatedPositioned(
                        top: _size.height / 36,
                        left: _expandServices ? 40 : -250,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 650),
                        child: Text(
                          'Our Services: ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      //Text
                      AnimatedPositioned(
                        top: _size.height / 16,
                        left: _expandServices ? 60 : -250,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 850),
                        child: Text(
                            '''This will be the services text\n\nThis will be the services text\n\nThis will be the services text\n\nThis will be the services text\n\nThis will be the services text''',
                            style: Theme.of(context).textTheme.bodyText2),
                      )
                    ],
                  ),
                ),
              ),

              //Our vision
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: _size.height / 4,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        top: _size.height / 36,
                        left: _expandVision ? 40 : -250,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 650),
                        child: Text(
                          'Our Vision:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      //Text for vision
                      AnimatedPositioned(
                        top: _size.height / 16,
                        left: _expandVision ? 60 : -250,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 850),
                        child: Text(
                            '''This will be the vision text\n\nThis will be the vision text\n\nThis will be the vision text\n\nThis will be the vision text\n\nThis will be the vision text''',
                            style: Theme.of(context).textTheme.bodyText2),
                      )
                    ],
                  ),
                ),
              ),

              //Our projects
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: _size.height / 4,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        top: _size.height / 36,
                        left: _expandProjects ? 40 : -250,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 650),
                        child: Text(
                          'Our Vision:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      //Text for Projects
                      AnimatedPositioned(
                        top: _size.height / 16,
                        left: _expandProjects ? 60 : -250,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 850),
                        child: Text(
                            '''This will be the Project text\n\nThis will be the Project text\n\nThis will be the Project text\n\nThis will be the Project text\n\nThis will be the Project text''',
                            style: Theme.of(context).textTheme.bodyText2),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
