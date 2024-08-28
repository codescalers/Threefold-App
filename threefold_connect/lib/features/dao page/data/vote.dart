import 'package:tfchain_client/generated/dev/types/pallet_dao/proposal/dao_votes.dart';
import 'package:tfchain_client/tfchain_client.dart';

Future<DaoVotes> vote(bool vote, String hash, int farmId) async {
  try {
    const mnemonic = "print also path fish pizza cannon seminar prison piano merry endorse flight"; //TO-DO NEED TO BE CHANGED WITH USER ACTUAL MNEMONIC 
    final client =
        Client("wss://tfchain.dev.grid.tf/ws", mnemonic, "sr25519"); 
    client.connect();
    final daoVotes = await client.dao.vote(farmId: farmId, hash: hash, approve: vote);
    await client.disconnect();
    print(daoVotes.toJson());
    return daoVotes;
  } catch (e) {
    throw Exception("Error occurred: $e");
  }
}
