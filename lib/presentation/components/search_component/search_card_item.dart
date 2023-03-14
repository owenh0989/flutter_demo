import 'package:flutter/material.dart';
import 'package:lumiere_note_sp/presentation/components/input/input_export.dart';
import 'package:lumiere_note_sp/presentation/pages/search/mock/mock_search.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';
import 'package:lumiere_note_sp/presentation/theme/spacing_alias.dart';

class SearchCardItem extends StatelessWidget {
  const SearchCardItem({Key? key, required this.searchModel}) : super(key: key);
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Image.network(
              searchModel.avatar,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
            SpacingAlias.SizeWidth24,
            TextCommon(
              text: searchModel.name,
              color: AppColors.primary,
              fontWeight: FontWeight.w300,
            )
          ],
        ),
      ),
    );
  }
}
