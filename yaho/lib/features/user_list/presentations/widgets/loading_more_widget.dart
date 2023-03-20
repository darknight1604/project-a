import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../gen/locale_keys.g.dart';
import '../../blocs/user_list/user_list_bloc.dart';
import 'package:yaho/core/extensions/text_style_extension.dart';

class LoadingMoreWidget extends StatelessWidget {
  const LoadingMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<UserListBloc>(context).add(LoadMoreUserListEvent());
      },
      child: Text(
        LocaleKeys.loadMore.tr(),
        style: Theme.of(context).textTheme.bodyMedium?.semiBold,
      ),
    );
  }
}
