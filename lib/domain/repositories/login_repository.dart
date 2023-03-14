import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/data/graphql/nft_mutation.dart';
import 'package:lumiere_note_sp/data/remotes/base/base_response.dart';
import 'package:lumiere_note_sp/data/remotes/graphql/client.dart';
import 'package:lumiere_note_sp/data/remotes/graphql/client_provider.dart';
import 'package:lumiere_note_sp/domain/repositories/base/base_repository.dart';

final LoginRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return LoginRepository(client);
});

class LoginRepository extends BaseRepository {
  LoginRepository(this.client);

  final GraphQLApiClient client;
  static String loginOperationName = 'login';

  Future<SealedResult<QueryResult>> login(String email, String password) async {
    final result = await client.mutate(gql(NFTMutation.loginMutation),
        variables: {
          "request": {
            "email": email,
            "password": password,
          },
        },
        operationName: loginOperationName);
    return result;
  }
}
