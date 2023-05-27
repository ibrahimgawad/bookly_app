import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';


class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMesage});
final String errMesage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMesage,style: Styles.textStyle18,));
  }
}