import 'package:flutter/material.dart';
import '../../../common/models/card_item.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';
import '../../../constants/constants.dart';

class CardItemListTile extends StatelessWidget {
  const CardItemListTile({
    super.key,
    required this.cardItem,
  });

  final CardItem cardItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          // vertical: 5,
        ),
        leading: Container(
          height: 90,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                '${AppConstants.uploadURL}/${cardItem.imgUrl}',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(
          cardItem.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          cardItem.subTitle,
          style: getRegularStyle(
            color: AppColors.primaryThreeElementText,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
