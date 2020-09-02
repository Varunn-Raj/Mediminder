import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.lightBlueAccent,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
// //        crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Container(
//             child: Text(
//               'Screen 1',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20
//               ),
//             ),
//             margin: EdgeInsets.all(16),
//           ),
//           FlatButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) => Screen2()
//               ));
//             },
//             child: Text('Go to next screen'),
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [
                TopCarousal(
                  imagename: AssetImage('assets/images/online.png'),
                  onTap: () {},
                ),
                TopCarousal(
                  imagename: AssetImage('assets/images/reminder.jpg'),
                  onTap: () {},
                ),
                TopCarousal(
                  imagename: AssetImage('assets/images/medicine.png'),
                  onTap: () {},
                ),
                TopCarousal(
                  imagename: AssetImage('assets/images/prescibe.jpg'),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ));
  }
}

// This is the function for the Carousal slider present on the top of the page
class TopCarousal extends StatelessWidget {
  final AssetImage imagename;
  final Function onTap;
  TopCarousal({this.imagename, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(image: imagename, fit: BoxFit.cover)),
      ),
      onPressed: onTap,
    );
  }
}
