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
    Future.delayed(Duration(milliseconds: 650), () {
      if (mounted) {
        setState(() {
          _expandServices = true;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 1450), () {
      if (mounted) {
        setState(() {
          _expandVision = true;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 2250), () {
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
    return SizedBox(
      width: _size.width,
      height: _size.height * 0.70,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                      ),
                      //Image showing our services
                      AnimatedPositioned(
                        top: _size.height / 16,
                        right: _expandServices ? 100 : -_size.width,
                        curve: Curves.decelerate,
                        duration: Duration(milliseconds: 1550),
                        child: Container(
                          height: _size.height / 4 - 100,
                          width: _size.width / 3,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: Text('An Image will be displayed here')),
                        ),
                      ),
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
                      ),
                      //Image showing our vision
                      AnimatedPositioned(
                        top: _size.height / 16,
                        right: _expandVision ? 100 : -_size.width,
                        curve: Curves.decelerate,
                        duration: Duration(milliseconds: 1550),
                        child: Container(
                          height: _size.height / 4 - 100,
                          width: _size.width / 3,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: Text('An Image will be displayed here')),
                        ),
                      ),
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
                          'Our Projects:',
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
                      ),
                      //Image showing our projects
                      AnimatedPositioned(
                        top: _size.height / 16,
                        right: _expandProjects ? 100 : -_size.width,
                        curve: Curves.decelerate,
                        duration: Duration(milliseconds: 1550),
                        child: Container(
                          height: _size.height / 4 - 100,
                          width: _size.width / 3,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: Text('An Image will be displayed here')),
                        ),
                      ),
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
