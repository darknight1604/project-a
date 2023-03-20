import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho/gen/locale_keys.g.dart';

import '../../../core/widgets/loading_widget.dart';
import '../blocs/user_list/user_list_bloc.dart';
import '../infrastructures/services/user_service_impl.dart';
import 'widgets/grid_view_user_widget.dart';
import 'widgets/list_view_user_widget.dart';
import 'package:yaho/core/extensions/text_style_extension.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserListBloc(UserServiceImpl())
          ..add(
            FetchUserListEvent(),
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 30.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _SwitchModeWidget(),
              Expanded(
                child: BlocBuilder<UserListBloc, UserListState>(
                  buildWhen: (previous, current) => current is! UserListLoading,
                  builder: (context, state) {
                    if (state is UserListViewLoaded) {
                      return ListViewUserWidget(
                        listUser: state.listUser,
                      );
                    }
                    if (state is UserGridViewLoaded) {
                      return GridViewUserWidget(
                        listUser: state.listUser,
                      );
                    }
                    return const LoadingWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SwitchModeWidget extends StatefulWidget {
  const _SwitchModeWidget();

  @override
  State<_SwitchModeWidget> createState() => _SwitchModeWidgetState();
}

class _SwitchModeWidgetState extends State<_SwitchModeWidget> {
  bool _mode = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _mode ? LocaleKeys.listView.tr() : LocaleKeys.gridView.tr(),
            style: Theme.of(context).textTheme.bodyMedium?.bold,
          ),
        ),
        InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              _mode = !_mode;
            });
            BlocProvider.of<UserListBloc>(context)
                .add(SwitchModeListUserEvent());
          },
          child: Icon(
            _mode ? Icons.toggle_on_outlined : Icons.toggle_off_outlined,
            size: 40,
          ),
        ),
      ],
    );
  }
}
