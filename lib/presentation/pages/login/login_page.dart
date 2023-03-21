import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/gen/assets.gen.dart';
import 'package:lumiere_note_sp/presentation/components/components.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';
import 'package:lumiere_note_sp/presentation/view_models/login/login_provider.dart';

class LoginPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFinished = useState(false);
    final viewModel = ref.watch(loginProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.blueBg,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Assets.images.loginImage.image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: SwipeableButtonView(
                  buttonText: 'SLIDE TO PAYMENT',
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: AppColors.primary,
                  isFinished: isFinished.value,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      isFinished.value = true;
                    });
                  },
                  onFinish: () async {
                    isFinished.value = false;
                    viewModel.gotoHome();
                  },
                ),
              ),
              TextCommon(text: "Policy")
            ],
          )
        ],
      ),
    );
  }
}
