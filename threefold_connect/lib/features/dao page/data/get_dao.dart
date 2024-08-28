
import 'package:tfchain_client/models/dao.dart';
import 'package:tfchain_client/tfchain_client.dart';

Future<Map<String ,List<Proposal>?>> getProposals() async {
  try {
    
    final client = QueryClient("wss://tfchain.dev.grid.tf/ws");
    await client.connect();
    final json= await client.dao.get();
    await client.disconnect();
    return json;
  } catch (e) {
    throw Exception("Error occurred: $e");
  }
} 