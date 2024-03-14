import 'package:demo/pages/const.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.desc});
  final String title, price, image, desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.shop),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            space,
            Text(
              desc,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('+ Cart'))
          ],
        ),
      ),
    );
  }
}
