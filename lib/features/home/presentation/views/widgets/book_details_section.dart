import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_iteam.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});
final BookModel books;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .20),
          child:  CustomBookItem(
            imageUrl:
               books.volumeInfo?.imageLinks?.thumbnail??"",
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(books.volumeInfo!.title!,
        textAlign: TextAlign.center,
            style: Styles.textStyle30.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 7,
        ),
        Text(books.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(
                color: Colors.white.withOpacity(.7),
                fontStyle: FontStyle.italic)),
        const SizedBox(height: 18),
         BookRating(
          count:books.volumeInfo?.ratingsCount??0,
          rating: books.volumeInfo?.averageRating??0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 36,
        ),
         BooksAction(books: books),
      ],
    );
  }
}
