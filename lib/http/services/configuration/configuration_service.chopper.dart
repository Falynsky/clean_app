// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ConfigurationService extends ConfigurationService {
  _$ConfigurationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ConfigurationService;

  @override
  Future<Response<Map<String, Object>>> isAlive() {
    final Uri $url = Uri.parse('/isAlive');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, Object>, Map<String, Object>>($request);
  }
}
