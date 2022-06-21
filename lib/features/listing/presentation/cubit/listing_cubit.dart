import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'listing_state.dart';

class ListingCubit extends Cubit<ListingState> {
  ListingCubit() : super(ListingInitial());
}
