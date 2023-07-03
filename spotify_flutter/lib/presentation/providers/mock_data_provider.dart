// Es inmutable
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_flutter/infraestructure/datasources/local_datasource.dart';
import 'package:spotify_flutter/infraestructure/repositories/mock_repository_impl.dart';

final mockRepositoryProvider = Provider((ref) {
  return MockRepositoryImpl(LocalDataSource());
});
