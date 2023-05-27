import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

import '../../../../home/presentation/views/widgets/book_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search Result",
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(books: state.books[index]),
              );
            },
          );
        } else if (state is SearchFailure) {
          if (state.errMesage.contains(
              "type 'Null' is not a subtype of type 'Iterable<dynamic>'")) {
            return const Center(child:  Text('Please enter a valid book name '));
          } else {
            return CustomErrorWidget(
              errMesage: state.errMesage,
            );
          }
        } else if (state is SearchLoading) {
          return const CustomLoadingIndecator();
        } else {
          return const Center(
              child: Text(
            "Please Enter The Name Of The Book",
            style: Styles.textStyle20,
            textAlign: TextAlign.center,
          ));
        }
      },
    );
  }
}
