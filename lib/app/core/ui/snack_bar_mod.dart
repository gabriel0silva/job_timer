import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_config_ui.dart';

class AsukaSnackbarMod extends SnackBar {
  AsukaSnackbarMod._(
    Key? key,
    String content,
    Color background, {
    IconData? icon,
    SnackBarAction? action,
    double? width,
    double elevation = 2,
  }) : super(
          width: width,
          elevation: elevation,
          backgroundColor: background,
          action: action,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              4,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 20,
                  color: AppConfigUi.primarySwatch.shade200,
                ),
                const SizedBox(width: 10)
              ],
              Expanded(
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppConfigUi.primarySwatch.shade200,
                  ),
                ),
              ),
              if (action == null)
                InkWell(
                  child: Icon(Icons.close, color: AppConfigUi.primarySwatch.shade200),
                  onTap: Asuka.hideCurrentSnackBar, //
                )
            ],
          ),
        );

  
  factory AsukaSnackbarMod.msg(
    String content, {
    Key? key,
    double? width,
    double elevation = 2,
  }) =>
      AsukaSnackbarMod._(
        key,
        content,
        Colors.white,
        icon: Icons.report,
        width: width,
        elevation: elevation,
      );

  void call() => show();

  void show() => Asuka.showSnackBar(this);
  
}
