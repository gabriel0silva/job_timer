import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerHeaderDetail<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final VoidCallback controller;
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final Color backgroundcolor;
  final Color color;

  const DrawerHeaderDetail({
    super.key,
    required this.controller,
    required this.bloc,
    required this.selector,
    required this.backgroundcolor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: InkWell(
        onTap: controller,
        child: BlocSelector<B, S, bool>(
          bloc: bloc,
          selector: (selector),
          builder: (context, showLoading) {
            if (!showLoading) {
              return const Text('Sair');
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                backgroundColor: backgroundcolor,
                color: color,
              ),
            );
          },
        ),
      )),
    );
  }
}
