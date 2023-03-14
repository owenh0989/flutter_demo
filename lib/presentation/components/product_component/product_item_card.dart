import 'package:flutter/material.dart';
import 'package:lumiere_note_sp/presentation/components/input/text_form_label.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';
import 'package:lumiere_note_sp/presentation/theme/font_alias.dart';
import 'package:lumiere_note_sp/presentation/theme/spacing_alias.dart';
import 'package:lumiere_note_sp/utils/formater/formater.dart';

class ProductCardView extends StatelessWidget {
  const ProductCardView(
      {Key? key,
      required this.product,
      this.imageAlignment = Alignment.bottomCenter,
      this.onTap})
      : super(key: key);

  final Product product;
  final Alignment imageAlignment;
  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: add function when tap
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: AppColors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network('${product.image}',
                height: 180, alignment: imageAlignment, fit: BoxFit.fitWidth),
            SpacingAlias.SizeHeight20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelCustom(
                    padding: EdgeInsets.zero,
                    label: '${product.brand}',
                    maxLines: 1,
                    fontSize: FontAlias.fontAlias20,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w300,
                    color: AppColors.grey1,
                  ),
                  Container(
                    height: 100,
                    child: LabelCustom(
                      padding: EdgeInsets.zero,
                      label: '${product.name}',
                      maxLines: 3,
                      fontSize: FontAlias.fontAlias20,
                      fontWeight: FontWeight.w300,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('￥${numFormatter(product.price)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.bgButton,
                            fontSize: FontAlias.fontAlias20,
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  Product(this.name, this.brand, this.objectID, this.image, this.price);

  final int price;

  final String name;

  final String brand;

  final String objectID;

  final String image;
}
