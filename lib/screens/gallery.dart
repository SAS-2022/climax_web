import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late Size _size;
  List<String> demoGallery = [
    'Image 1',
    'Image 2',
    'Image 3',
    'Image 4',
    'Image 5',
    'Image 6',
    'Image 7',
    'Image 8',
    'Image 9',
    'Image 10',
    'Image 11',
  ];
  String? _selectedImage;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SizedBox(
      height: _size.height * 0.7,
      child: SingleChildScrollView(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Grid to show all the photos
              SizedBox(
                height: _size.height * 0.65,
                width: (_size.width / 2) - 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 20,
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 20),
                    itemCount: demoGallery.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedImage = demoGallery[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text('${demoGallery[index]}')),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              //Displaying the photo on a large scale
              SizedBox(
                height: _size.height * 0.65,
                width: (_size.width / 2) - 30,
                child: _selectedImage != null
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber[100]),
                        child: Center(
                          child: Text('$_selectedImage'),
                        ),
                      )
                    : Center(
                        child: Text('No Image has been selected'),
                      ),
              )
            ]),
      ),
    );
  }
}
