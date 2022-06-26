import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
