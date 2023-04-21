
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/ui/app_config_ui.dart';
import '../../core/ui/snack_bar_mod.dart';
import 'controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;

  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbarMod.msg(message).show();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              // color: AppConfigUi.theme.primaryColor,
              color: AppConfigUi.theme.primaryColor),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(36)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset('assets/images/ampulheta.png'),
                        ))),
                SizedBox(
                  height: screenSize.height * .10,
                ),
                SizedBox(
                  width: screenSize.width * .60,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      controller.signIn();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocSelector<LoginController, LoginState, bool>(
                          bloc: controller,
                          selector: (state) {
                            return state.status == LoginStatus.loading;
                          },
                          builder: (context, show) {
                            return Visibility(
                                visible: show,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    color: AppConfigUi.primarySwatch,
                                  ),
                                ));
                          },
                        ),
                        BlocSelector<LoginController, LoginState, bool>(
                          bloc: controller,
                          selector: (state) {
                            return state.status != LoginStatus.loading;
                          },
                          builder: (context, show) {
                            return Visibility(
                              visible: show,
                              child: Row(
                                children: [
                                  Image.asset('assets/images/icone.png'),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Text(
                                    "Google",
                                    style: TextStyle(
                                        color: AppConfigUi.primarySwatch,
                                        fontFamily: 'Roboto',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ), // child: Image.asset('assets/images/google.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
