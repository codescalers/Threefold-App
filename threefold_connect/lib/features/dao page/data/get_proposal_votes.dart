import 'package:tfchain_client/generated/dev/types/pallet_dao/proposal/dao_votes.dart';
import 'package:tfchain_client/tfchain_client.dart';

Future<DaoVotes> getProposalVotes(String hash) async {
  try {
    final client = QueryClient("wss://tfchain.dev.grid.tf/ws");
    await client.connect();
    final votes = await client.dao.getProposalVotes(hash: hash);
    await client.disconnect();
    return votes;
  } catch (e) {
    throw Exception("Error occurred: $e");
  }
}
