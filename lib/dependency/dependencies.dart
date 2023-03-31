import 'package:get_it/get_it.dart';
import 'package:wallpics_plus/services/home_services/home_services.dart';
import 'package:wallpics_plus/services/home_services/home_services_rest.dart';
import 'package:wallpics_plus/services/rest_service.dart';

GetIt dependency = GetIt.instance;

void init() {
  dependency.registerLazySingleton<RestService>(
    () => const RestService(
        baseUrl: "https://api.pexels.com/v1",
        keys: "S4YAktuo9gTTDBgUsQH7SWhXt4hoSJQnSB5vJifmdM1KOHZEoZz6weAK"),
  );
  dependency.registerLazySingleton<HomeService>(
    () => HomeServicesRest(),
  );
}
