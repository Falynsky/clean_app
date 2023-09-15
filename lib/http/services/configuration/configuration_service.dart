import 'package:chopper/chopper.dart';

part 'configuration_service.chopper.dart';

@ChopperApi()
abstract class ConfigurationService extends ChopperService {
  @Get(path: '/isAlive')
  Future<Response<Map<String, Object?>>> isAlive();

  static ConfigurationService create([ChopperClient? client]) => _$ConfigurationService(client);
}
