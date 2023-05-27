import 'package:bookly_app/core/utils/funcation/launch_url.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            fontSize: 18,
            text: "Free",
            textColor: Colors.black,
          )),
          Expanded(
              child: CustomButton(
            onPressed: () async {
            launchCustomUrl(context, books.volumeInfo!.previewLink!);
              }
            ,
            backgroundColor: const Color(0xffEf8262),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            fontSize: 16,
            text: getText(books),
            textColor: Colors.white,
          )),
        ],
      ),
    );
  }
  
  getText(BookModel books) {
    if(books.volumeInfo?.previewLink==null){
      return "Not Avaliable";
    }else{
      return "Preview";
    }
  }
  

}

