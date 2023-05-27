import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class jhopPhoto extends StatefulWidget {
  const jhopPhoto({Key? key}) : super(key: key);

  @override
  State<jhopPhoto> createState() => _jhopPhotoState();
}

class _jhopPhotoState extends State<jhopPhoto> {
  List image = [
    'https://i.pinimg.com/originals/95/29/20/95292056df1d8183c513ed715a25394b.jpg',
    'https://pbs.twimg.com/media/DaPcSJDUQAA6s69.jpg:orig',
    'https://lh3.googleusercontent.com/3T5WMn86vR-RfXdPLP0yx5lC3Flk5bP-qOSkkJpr8J6Oe9UU6HzXBzdklUG3C9erBNTRA3PbZl9k72nURc-KwMaOK1HHqXzMwA=w1200-h630-rj-pp',
  ];
  CarouselController photoController = CarouselController();
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("J Hop"),
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
