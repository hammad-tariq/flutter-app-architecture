import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  @override
  // TODO: implement initialState
  ListingState get initialState => null;

  @override
  Stream<ListingState> mapEventToState(
    ListingEvent event,
  ) async* {
    // TODO: implement
  }
}
