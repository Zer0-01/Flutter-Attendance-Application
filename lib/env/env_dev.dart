import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _EnvDev.baseUrl;

  @EnviedField(varName: 'ENDPOINT_SIGN_IN')
  static const String endpointSignIn = _EnvDev.endpointSignIn;
}
