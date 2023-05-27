import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class vPhoto extends StatefulWidget {
  const vPhoto({Key? key}) : super(key: key);

  @override
  State<vPhoto> createState() => _vPhotoState();
}

class _vPhotoState extends State<vPhoto> {
  List image = [
    'https://ksassets.timeincuk.net/wp/uploads/sites/55/2019/01/GettyImages-1052926034.jpg',
    'https://datacdn.btimesonline.com/data/images/full/117963/bts-v.jpg',
    'https://datacdn.btimesonline.com/data/images/full/116047/bts-v.jpg',
  ];
  CarouselController photoController = CarouselController();
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("V"),
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
