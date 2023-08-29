import 'package:flutter/material.dart';

class SingleThirdPartyLogBtn extends StatelessWidget {
  const SingleThirdPartyLogBtn({
    super.key,
    required this.imgAsset,
    required this.tapHandler,
  });

  final Function tapHandler;
  final String imgAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tapHandler(),
      child: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Image.asset('assets/icons/$imgAsset.png'),
      ),
    );
  }
}
