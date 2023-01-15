import 'dart:async';

import '../../models/clinic/clinic.dart';
import '/core/constant/api_routes.dart';
import '/core/services/http/http_service.dart';
import '/locator.dart';

abstract class ClinicsRemoteDataSource {
  Future<Clinic> fetchClinic([Map<String, dynamic>? parameters]);
  //Future<Review> sendReview([Map<String, dynamic>? parameters]);
  Future<List<Clinic>> fetchClinicsList([Map<String, dynamic>? parameters]);

  //Future<Genre> fetchGenre([Map<String, dynamic>? parameters]);

  //Future<List<Genre>> fetchGenresList([Map<String, dynamic>? parameters]);
}

class ClinicsRemoteDataSourceImpl implements ClinicsRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<Clinic> fetchClinic([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .getHttp(ApiRoutes.clinic(parameters!['id']), parameters));

    return Clinic.fromMap(restData);
  }

  /*@override
  Future<Review> sendReview([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .postHttp(ApiRoutes.review(parameters!['id']), parameters));

    return Review.fromMap(restData);
  }*/

  @override
  Future<List<Clinic>> fetchClinicsList(
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.clinics, parameters);

    var list = jsonData['data'] as List<dynamic>;

    var items =
        list.map<Clinic>((vendorMap) => Clinic.fromMap(vendorMap)).toList();

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
