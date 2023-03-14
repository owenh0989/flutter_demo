import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/data/graphql/nft_query.dart';
import 'package:lumiere_note_sp/data/remotes/base/base_response.dart';
import 'package:lumiere_note_sp/data/remotes/graphql/client.dart';
import 'package:lumiere_note_sp/data/remotes/graphql/client_provider.dart';
import 'package:lumiere_note_sp/domain/repositories/base/base_repository.dart';

final otherRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return OtherRepository(client);
});

class OtherRepository extends BaseRepository {
  OtherRepository(this.client);

  final GraphQLApiClient client;
  static String categoriesOperationName = 'categories';
  static String tagsOperationName = 'tags';
  static String networksOperationName = 'networks';

  Future<SealedResult<QueryResult>> getCategories() async {
    final result = await client.mutate(gql(NFTQuery.categoriesQuery),
        operationName: categoriesOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> getTags() async {
    final result = await client.mutate(gql(NFTQuery.tagsQuery),
        operationName: tagsOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> getNetworks() async {
    final result = await client.mutate(gql(NFTQuery.networksQuery),
        operationName: networksOperationName);
    return result;
  }
}
