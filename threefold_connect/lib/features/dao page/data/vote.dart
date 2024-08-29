import 'package:tfchain_client/generated/dev/types/pallet_dao/proposal/dao_votes.dart';
import 'package:tfchain_client/tfchain_client.dart';

//TODO: mnemonic need to be changed with user mnemonic
const mnemonic =
    "print also path fish pizza cannon seminar prison piano merry endorse flight";

Future<DaoVotes> vote(bool vote, String hash, int farmId) async {
  try {
    final client = Client("wss://tfchain.dev.grid.tf/ws", mnemonic, "sr25519");
    client.connect();
    final daoVotes =
        await client.dao.vote(farmId: farmId, hash: hash, approve: vote);
    await client.disconnect();
    return daoVotes;
  } catch (e) {
    throw Exception("Error occurred: $e");
  }
}
