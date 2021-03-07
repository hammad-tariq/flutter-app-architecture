import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingState get initialState => ListingInitial();

  ListingBloc(ListingState initialState) : super(initialState);

  @override
  Stream<ListingState> mapEventToState(
    ListingEvent event,
  ) async* {
    // TODO: implement
  }
}
