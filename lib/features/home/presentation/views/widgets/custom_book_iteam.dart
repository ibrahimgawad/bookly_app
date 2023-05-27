import 'package:flutter/material.dart';



class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image:  DecorationImage(
            image: NetworkImage(
             imageUrl,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
