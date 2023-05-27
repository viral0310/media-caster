import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class jkPhoto extends StatefulWidget {
  const jkPhoto({Key? key}) : super(key: key);

  @override
  State<jkPhoto> createState() => _jkPhotoState();
}

class _jkPhotoState extends State<jkPhoto> {
  List image = [
    'https://timesofindia.indiatimes.com/photo/79362586/size-343987/79362586.jpg',
    'https://wallpaperaccess.com/full/853857.jpg',
    'https://wallsdesk.com/wp-content/uploads/2016/12/Jung-Kook-HD-Background-.jpg',
  ];
  CarouselController photoController = CarouselController();
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("JK"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          CarouselSlider(
            carouselController: photoController,
            items: image
                .map((e) => Container(
                      width: _width,
                      child: Image.network(e),
                    ))
                .toList(),
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                initialPage: initialPage,
                onPageChanged: (val, _) {
                  setState(() {
                    initialPage = val;
                  });
                },
                height: 250,
                viewportFraction: 0.8,
                enlargeCenterPage: true),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: _width * 0.3,
            decoration: BoxDecoration(
                //  color: Colors.blue.shade500,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: image.map((e) {
                int i = image.indexOf(e);
                return Row(
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor:
                            (initialPage == i) ? Colors.black : Colors.blue,
                      ),
                      onTap: () async {
                        await photoController.animateToPage(i);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
