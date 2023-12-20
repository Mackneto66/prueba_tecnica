import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/beer.dart';
import '../../../infrastructure/api/api_service.dart';

part 'beer_cubit_state.dart';

class BeerCubit extends Cubit<BeerState> {
  final ApiService _apiService = ApiService();

  BeerCubit() : super(BeerState( beers: [], isLoading: true, )){
    getBeers();
  }
  
  void getBeers()async{
    final beers = await _apiService.getBeers();
    emit(BeerState(beers: beers, isLoading: false));
  }
}
