import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/beer.dart';
import '../../../infrastructure/api/api_service.dart';

part 'item_beer_state.dart';

class ItemBeerCubit extends Cubit<ItemBeerState> {
  ItemBeerCubit() : super(ItemBeerState(isLoading: true));
  final ApiService _apiService = ApiService();


  void getBeer(String id) async {
    final beer = await _apiService.getBeer(id);
    emit(ItemBeerState(beers: beer, isLoading: false));
  }
}
