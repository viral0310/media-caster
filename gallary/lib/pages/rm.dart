import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class rmPhoto extends StatefulWidget {
  const rmPhoto({Key? key}) : super(key: key);

  @override
  State<rmPhoto> createState() => _rmPhotoState();
}

class _rmPhotoState extends State<rmPhoto> {
  List image = [
    'https://cdn1.i-scmp.com/sites/default/files/styles/1200x800/public/images/methode/2018/10/24/40769bf6-d740-11e8-a41d-3d2712b32637_1280x720_171954.jpg?itok=ywHhP-6K',
    'https://assets.teenvogue.com/photos/5db855bb9d38aa0009be9e93/16:9/w_1280,c_limit/fb.jpg',
    'https://assets.teenvogue.com/photos/5c6ee813e78cdb389d7a31b3/16:9/w_2560%2Cc_limit/lede.jpg',
  ];
  CarouselController photoController = CarouselController();
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("RM"),
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
