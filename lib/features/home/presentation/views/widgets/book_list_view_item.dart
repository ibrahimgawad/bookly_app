import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_iteam.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: books);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookItem(imageUrl: books.volumeInfo!.imageLinks?.thumbnail??""),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      books.volumeInfo!.title!,
                      style: Styles.textStyle20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    books.volumeInfo!.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BookRating(
                          rating: (books.volumeInfo!.averageRating??0),
                          count: books.volumeInfo!.ratingsCount??0,
                          mainAxisAlignment: MainAxisAlignment.end),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
