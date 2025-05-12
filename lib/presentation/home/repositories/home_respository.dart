import 'package:get_it/get_it.dart';
import 'package:http_client/http_client.dart';

final class HomeRepository {
  const HomeRepository();

  Future<String> translateText(String text) async {
    final httpClient = GetIt.I<Http>();

    return 'Translated: $text';
  }
}
