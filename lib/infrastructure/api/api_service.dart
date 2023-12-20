import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/models/beer.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<List<Beers>> getBeers() async {
    try {
      final response = await _dio.get('https://api.punkapi.com/v2/beers');
      if (response.statusCode == 200) {
        final beers = beersFromJson(jsonEncode(response.data));
        return beers;
      } else {
        throw Exception('Error en la llamada a la api ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error en la llamada a la api $error');
    }
  }

// https://api.punkapi.com/v2/beers/1
  Future<Beers> getBeer(String id) async {
    try {
      final response = await _dio.get('https://api.punkapi.com/v2/beers/$id');
      if (response.statusCode == 200) {
        final beer = beersFromJson(jsonEncode(response.data));
        return beer[0];
      } else {
        throw Exception('Error en la llamada a la api ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error en la llamada a la api $error');
    }
  }
}
