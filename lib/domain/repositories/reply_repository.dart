import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/data/graphql/nft_mutation.dart';
import 'package:lumiere_note_sp/data/remotes/base/base_response.dart';
import 'package:lumiere_note_sp/data/remotes/graphql/client.dart';
import 'package:lumiere_note_sp/data/remotes/graphql/client_provider.dart';
import 'package:lumiere_note_sp/domain/entities/input/reply_input.dart';
import 'package:lumiere_note_sp/domain/entities/input/reply_update_input.dart';
import 'package:lumiere_note_sp/domain/repositories/base/base_repository.dart';

final replyRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return ReplyRepository(client);
});

class ReplyRepository extends BaseRepository {
  ReplyRepository(this.client);

  final GraphQLApiClient client;
  static String addReplyOperationName = 'replyAdd';
  static String updateReplyOperationName = 'replyUpdate';

  Future<SealedResult<QueryResult>> createReport(ReplyInput replyInput) async {
    final result = await client.query(gql(NFTMutation.replayAdd),
        variables: replyInput.toJson(), operationName: addReplyOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> updateReport(
      ReplyUpdateInput replyUpdateInput) async {
    final result = await client.query(gql(NFTMutation.projectUpdate),
        variables: replyUpdateInput.toJson(),
        operationName: updateReplyOperationName);
    return result;
  }
}
