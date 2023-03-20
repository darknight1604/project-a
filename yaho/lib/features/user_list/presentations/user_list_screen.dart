import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/loading_widget.dart';
import '../blocs/user_list/user_list_bloc.dart';
import '../infrastructures/services/user_service_impl.dart';
import 'widgets/grid_view_user_widget.dart';
import 'widgets/list_view_user_widget.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter app demo'),
      ),
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
            children: [
              const _SwitchModeWidget(),
              Expanded(
                child: BlocBuilder<UserListBloc, UserListState>(
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
  State<_SwitchModeWidget> createState() => __SwitchModeWidgetState();
}

class __SwitchModeWidgetState extends State<_SwitchModeWidget> {
  bool _mode = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            _mode = !_mode;
          });
          BlocProvider.of<UserListBloc>(context).add(SwitchModeListUserEvent());
        },
        child: Icon(
          _mode ? Icons.toggle_on_outlined : Icons.toggle_off_outlined,
          size: 40,
        ),
      ),
    );
  }
}
