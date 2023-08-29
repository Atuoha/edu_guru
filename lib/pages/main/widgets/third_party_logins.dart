import 'package:edu_guru/pages/main/widgets/single_thirdparty_log_btn.dart';
import 'package:flutter/material.dart';

class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleThirdPartyLogBtn(
          imgAsset: 'facebook',
          tapHandler: () {},
        ),
        const SizedBox(width: 10),
        SingleThirdPartyLogBtn(
          imgAsset: 'google',
          tapHandler: () {},
        ),
        const SizedBox(width: 10),
        SingleThirdPartyLogBtn(
          imgAsset: 'apple',
          tapHandler: () {},
        ),
      ],
    );
  }
}
