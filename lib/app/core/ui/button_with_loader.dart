import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_config_ui.dart';

class ButtonWithLoader<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;
  final String label;
  final Color backgroundcolor;
  final Color color;

  const ButtonWithLoader({
    super.key,
    required this.selector,
    required this.bloc,
    required this.onPressed,
    required this.label, 
    required this.backgroundcolor, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: BlocSelector<B, S, bool>(
        bloc: bloc,
        selector: (selector),
        builder: (context, showLoading) {
          if (!showLoading) {
            return Text(label);
          }
          return SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              strokeWidth: 3,
                backgroundColor: backgroundcolor,
                color: color,
              ),
          );
        },
      ),
    );
  }
}
