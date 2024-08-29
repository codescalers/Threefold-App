import 'package:gridproxy_client/gridproxy_client.dart';
import 'package:gridproxy_client/models/farms.dart';
import 'package:threefold_connect/main.reflectable.dart';

Future<List<Farm>> getMyFarms(int twinId) async {
  try {
    initializeReflectable();
    GridProxyClient client = GridProxyClient('https://gridproxy.dev.grid.tf/');
    final farms =
        await client.farms.list(ListFarmsQueryParameters(twin_id: twinId));
    return farms;
  } catch (e) {
    throw Exception("Error occurred: $e");
  }
}
