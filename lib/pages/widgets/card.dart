import 'package:demo/pages/const.dart';
import 'package:flutter/material.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  final String title, price, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        space,
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(image)),
          ),
        ),
        Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space,
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(),
                maxLines: 2,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    price,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 204, 135, 135)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
