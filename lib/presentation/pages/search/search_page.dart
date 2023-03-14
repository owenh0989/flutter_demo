import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/generated/locale_keys.g.dart';
import 'package:lumiere_note_sp/presentation/components/appbar/app_bar_custom.dart';
import 'package:lumiere_note_sp/presentation/components/input/input_export.dart';
import 'package:lumiere_note_sp/presentation/components/search_component/search_bar.dart';
import 'package:lumiere_note_sp/presentation/components/search_component/search_card_list.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';
import 'package:lumiere_note_sp/presentation/theme/spacing_alias.dart';
import 'package:lumiere_note_sp/presentation/view_models/search/search_provider.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBarCustom(
            heightBar: kToolbarHeight * 2.5,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  TextCommon(
                    text: LocaleKeys.keyword.tr(),
                    color: AppColors.yellow3,
                    fontSize: 14,
                  ),
                  SpacingAlias.SizeHeight12,
                  SearchBar(viewModel: ref.read(searchProvider.notifier)),
                  Spacer(),
                ],
              ),
            )),
        backgroundColor: Colors.white,
        body: SearchCardList());
  }
}
