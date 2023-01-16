import 'dart:async';

import '../../models/doctor/doctor.dart';
import '../../models/review/review.dart';
import '/core/constant/api_routes.dart';
import '/core/services/http/http_service.dart';
import '/locator.dart';

abstract class DoctorsRemoteDataSource {
  Future<Doctor> fetchDoctor([Map<String, dynamic>? parameters]);
  // Future<Doctor> addDoctor([Map<String, dynamic>? parameters]);
  Future<Review> sendReview([Map<String, dynamic>? parameters]);
  Future<List<Doctor>> fetchDoctorsList([Map<String, dynamic>? parameters]);

  //Future<Genre> fetchGenre([Map<String, dynamic>? parameters]);

  //Future<List<Genre>> fetchGenresList([Map<String, dynamic>? parameters]);
}

class DoctorsRemoteDataSourceImpl implements DoctorsRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<Doctor> fetchDoctor([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .getHttp(ApiRoutes.doctor(parameters!['id']), parameters));

    return Doctor.fromMap(restData);
  }

  @override
  Future<Review> sendReview([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .postHttp(ApiRoutes.review(parameters!['id']), parameters));

    return Review.fromMap(restData);
  }

  @override
  Future<Doctor> addDoctor([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .postHttp(ApiRoutes.doctor(parameters!['id']), parameters));

    return Doctor.fromMap(restData);
  }

  @override
  Future<List<Doctor>> fetchDoctorsList(
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.doctors, parameters);

    var list = jsonData['data'] as List<dynamic>;

    var items =
        list.map<Doctor>((vendorMap) => Doctor.fromMap(vendorMap)).toList();

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
