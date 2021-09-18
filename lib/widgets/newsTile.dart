import 'package:flutter/material.dart';

Widget newsTile(String title, String desc, String image, BuildContext context) {
  return Container(
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: Color(0xFFF3F5FA),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .85,
            height: MediaQuery.of(context).size.height * .09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          maxLines: 2,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          desc,
          maxLines: 2,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    ),
  );
}
