import 'package:bloc/bloc.dart';

import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';

import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    var result = await homeRepo.fetchNewsetBooks();

    result.fold((failure) => emit(NewsetBooksFailure(failure.errMesage)),
        (books) => emit(NewsetBooksSuccess(books)));
  }
}
