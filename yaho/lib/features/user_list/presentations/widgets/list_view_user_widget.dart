import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaho/gen/locale_keys.g.dart';

import '../../../../core/widgets/image_widget.dart';
import '../../domains/models/user_response.dart';
import 'package:yaho/core/extensions/text_style_extension.dart';

import 'loading_more_widget.dart';

class ListViewUserWidget extends StatelessWidget {
  final List<User> listUser;
  const ListViewUserWidget({
    super.key,
    required this.listUser,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listUser.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10.0,
      ),
      itemBuilder: (context, index) {
        User user = listUser[index];
        if (user.isFake) {
          return const LoadingMoreWidget();
        }
        return _UserItemWidget(
          user: user,
        );
      },
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
      child: Row(
        children: [
          ImageWidget(
            imageUrl: user.avatar ?? '',
            width: 60,
            height: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.fullname,
                style: Theme.of(context).textTheme.bodyMedium?.semiBold,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${LocaleKeys.email.tr()}: ',
                    style: Theme.of(context).textTheme.bodyMedium?.regular,
                  ),
                  Text(
                    user.email ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.regular,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
