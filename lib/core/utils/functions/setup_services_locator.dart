import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/data_sources/home_remote_data_sources.dart';

var getit = GetIt.instance;
setupServicesLocator() {
  getit.registerSingleton<ApiServices>(
    ApiServices(Dio()),
  );
  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSourceImpl: HomeLocalDataSourceImpl(),
      homeRemoteDataSourceImpl: HomeRemoteDataSourceImpl(
        apiServices: getit.get<ApiServices>(),
      ),
    ),
  );
}
