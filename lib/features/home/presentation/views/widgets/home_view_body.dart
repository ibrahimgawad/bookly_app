
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';


import 'newset_books_list_view.dart';

import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      // تعتمد علي سليفر عشان تخلي اكتر من جزء في الاسكرينه يعملوا اسكرول مع بعض
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Newset Books",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
         SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 0),
            child: NewsetBooksListView(),
          ),
        ),
      ],
    );
  }
}
