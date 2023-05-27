import 'package:bloc/bloc.dart';

import 'package:bookly_app/core/models/book_model/book_model.dart';

import 'package:bookly_app/features/search/data/repos/search_repo.dart';

import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo,) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> featchResultSearch({required String bookName}) async {
    emit(SearchLoading());

    var result = await searchRepo.featchResultSearch(bookName: bookName);

    result.fold((failure) => emit(SearchFailure(failure.errMesage)),
        (books) => emit(SearchSuccess(books)));
  }
}
