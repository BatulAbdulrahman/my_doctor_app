import 'dart:async';

import '../../models/specialization/specialization.dart';
import '/core/constant/api_routes.dart';
import '/core/services/http/http_service.dart';
import '/locator.dart';

abstract class SpecializationsRemoteDataSource {
  Future<Specialization> fetchSpecialization(
      [Map<String, dynamic>? parameters]);
  //Future<Review> sendReview([Map<String, dynamic>? parameters]);
  Future<List<Specialization>> fetchSpecializationsList(
      [Map<String, dynamic>? parameters]);

  //Future<Genre> fetchGenre([Map<String, dynamic>? parameters]);

  //Future<List<Genre>> fetchGenresList([Map<String, dynamic>? parameters]);
}

class SpecializationsRemoteDataSourceImpl
    implements SpecializationsRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<Specialization> fetchSpecialization(
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .getHttp(ApiRoutes.specialization(parameters!['id']), parameters));

    return Specialization.fromMap(restData);
  }

  /*@override
  Future<Review> sendReview([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .postHttp(ApiRoutes.review(parameters!['id']), parameters));

    return Review.fromMap(restData);
  }*/

  @override
  Future<List<Specialization>> fetchSpecializationsList(
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.specializations, parameters);

    var list = jsonData['data'] as List<dynamic>;

    var items = list
        .map<Specialization>((vendorMap) => Specialization.fromMap(vendorMap))
        .toList();

    return items;
  }

  /*@override
  Future<Genre> fetchGenre([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .getHttp(ApiRoutes.genre(parameters!['id']), parameters));

    return Genre.fromMap(restData['data']);
  }*/

  /*@override
  Future<List<Genre>> fetchGenresList(
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.genres, parameters);

    var list = jsonData['data'] as List<dynamic>;

    var items = list.map<Genre>((itemMap) => Genre.fromMap(itemMap)).toList();

    return items;
  }*/
}
