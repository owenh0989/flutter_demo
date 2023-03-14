import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/presentation/components/input/input_export.dart';
import 'package:lumiere_note_sp/presentation/components/search_component/search_card_item.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';
import 'package:lumiere_note_sp/presentation/view_models/search/search_provider.dart';

class SearchCardList extends HookConsumerWidget {
  const SearchCardList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSearch = ref.watch(searchProvider).listSearch;
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 4, 0),
        child: ListView(children: [
          LabelCustom(
            label: "Categories",
            fontSize: 17,
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
          ),
          ...List.generate(listSearch.length,
              (index) => SearchCardItem(searchModel: listSearch[index]))
        ]));
  }
}
