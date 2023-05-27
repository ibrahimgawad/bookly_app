part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchFailure extends SearchState {

  final String errMesage;

 const SearchFailure(this.errMesage);
}
class SearchSuccess extends SearchState {
  final List<BookModel> books;

 const SearchSuccess(this.books);
}

