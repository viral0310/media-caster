import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallary/pages/j-hop.dart';
import 'package:gallary/pages/jk.dart';
import 'package:gallary/pages/rm.dart';
import 'package:gallary/pages/v.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gallary(),
    ),
  );
}

class Gallary extends StatefulWidget {
  const Gallary({Key? key}) : super(key: key);

  @override
  State<Gallary> createState() => _GallaryState();
}

class _GallaryState extends State<Gallary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" BTS Gallary"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            Container(
              child: StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => vPhoto(),
                        ));
                  },
                  child: Image.network(
                      'https://tse2.mm.bing.net/th?id=OIP.V6GIQj04lpH1JHW4aBd4ygHaLH&pid=Api&P=0'),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => rmPhoto(),
                      ));
                },
                child: Image.network(
                    'https://lh3.googleusercontent.com/bpxaE_6mwE4a9aYklUdCdua1glROuWdYB_gEdDlp-IbwW8vj3dZmOQGmgKISSJ33h3q6PpITYxbrv35oudkDqUaR3Pa8ilwu=w1600-rj'),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => jkPhoto(),
                      ));
                },
                child: Image.network(
                    'https://i.pinimg.com/736x/f6/e4/8f/f6e48fcb1a836b01cefdf4632eefb7ae.jpg'),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => jhopPhoto(),
                    ),
                  );
                },
                child: Image.network(
                    'https://lh3.googleusercontent.com/J17iolcpB2Eq3zhkDCP8Tx0DXADIlovJWDAceLs-EntEdP_8c_A6q27w0wAY9lrITo1RqlZCUUi6sxY8rVHglIDin22AguEJdA=w960-rj-nu-e365'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
