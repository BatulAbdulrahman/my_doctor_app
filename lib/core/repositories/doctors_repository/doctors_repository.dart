import 'dart:async';

import 'package:logging/logging.dart';
import '../../data_sources/doctors/doctors_remote_data_source.dart';
import '../../models/doctor/doctor.dart';
import '../../models/review/review.dart';
import '/core/exceptions/cache_exception.dart';
import '/core/exceptions/network_exception.dart';
import '/core/exceptions/repository_exception.dart';
import '/core/services/connectivity/connectivity_service.dart';
import '/locator.dart';

abstract class DoctorsRepository {
  Future<Doctor> fetchDoctor([Map<String, dynamic>? parameters]);
  Future<Review> sendReview([Map<String, dynamic>? parameters]);

  Future<List<Doctor>> fetchDoctorsList([Map<String, dynamic>? parameters]);

  //Future<Genre> fetchGenre([Map<String, dynamic>? parameters]);

  //Future<List<Genre>> fetchGenresList([Map<String, dynamic>? parameters]);
}

class DoctorsRepositoryImpl implements DoctorsRepository {
  final DoctorsRemoteDataSource? remoteDataSource =
      locator<DoctorsRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('DoctorsRepositoryImpl');

  @override
  Future<Review> sendReview([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.sendReview(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }

  @override
  Future<Doctor> fetchDoctor([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchDoctor(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }

  @override
  Future<List<Doctor>> fetchDoctorsList(
      [Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchDoctorsList(parameters);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch posts remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch posts locally');
      throw RepositoryException(e.message);
    }
  }

  /*@override
  Future<Genre> fetchGenre([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchGenre(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }*/

  /*@override
  Future<List<Genre>> fetchGenresList(
      [Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchGenresList(parameters);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch posts remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch posts locally');
      throw RepositoryException(e.message);
    }
  }*/
}
