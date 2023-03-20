import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaho/gen/locale_keys.g.dart';

import '../../../../core/widgets/image_widget.dart';
import '../../domains/models/user_response.dart';
import 'package:yaho/core/extensions/text_style_extension.dart';

class GridViewUserWidget extends StatelessWidget {
  final List<User> listUser;
  const GridViewUserWidget({
    super.key,
    required this.listUser,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.25,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: listUser
          .map((e) => _UserItemWidget(
                user: e,
              ))
          .toList(),
    );
  }
}

class _UserItemWidget extends StatelessWidget {
  final User user;
  const _UserItemWidget({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWidget(
            imageUrl: user.avatar ?? '',
            width: 60,
            height: 60,
          ),
          Text(
            user.fullname,
            style: Theme.of(context).textTheme.bodyMedium?.semiBold,
          ),
          Text(
            user.email ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium?.regular,
          ),
        ],
      ),
    );
  }
}
