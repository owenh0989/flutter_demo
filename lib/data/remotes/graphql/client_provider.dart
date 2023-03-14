import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/data/remotes/graphql/client.dart';

final clientProvider = Provider((_) {
  return GraphQLApiClient();
});
