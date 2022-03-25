import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late Size _size;
  var projects = [
    'Project 1',
    'Project 2',
    'Project 3',
  ];

  ScrollController _aboutUsScrollController = ScrollController();
  ScrollController _projectsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: _aboutUsScrollController,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: _size.width,
          height: _size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //Text Defining who we are
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  '''
Who We Are ??

At Climax we are dedicated to a quality finish. We go for the detail, making sure that our Clients are satisfied. 
Above all we use the right equipment, and employ the right personnel
  – who are highly trained and certified 
  – all to make sure that the work is completed in time and to high standards, no matter the season or time of the day

Our Company  can undertake complete contract cleaning services on daily, weekly and monthly schedules or whenever required,
even 24 hrs.-a-day!. We have the management personnel required for any type and size of job.

Moreover, we give our employees specifications and precise work schedules and supervise their performance. With our vast 
range of modern equipment together with our dedicated team of professional cleaners, we can provide impeccable results 
that leave our Customers satisfied!

''',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  '''
Our Projects

We have successfuly completed a list of projects in Lebanon that have earned us the approval and satisfaction of our clients.

This is just a small example on how good we are:

''',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Center(
                child: SizedBox(
                  height: _size.height / 5,
                  width: _size.width - 100,
                  child: ListView.builder(
                      controller: _projectsScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            height: _size.height / 5,
                            width: _size.width / 2,
                            child: Center(
                                child: Text('${projects[index].toString()}')),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
