import 'package:esacc/widgets/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/social_login_cubit.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: SocialBox(
              icon: AppSVGAssets.google,
              onTap: () {
                context.read<SocialLoginCubit>().loginWithGoogle();
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SocialBox(
              icon: AppSVGAssets.facebook,
              onTap: () {
                context.read<SocialLoginCubit>().loginWithFacebook();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SocialBox extends StatelessWidget {
  const SocialBox({super.key, required this.icon, this.onTap});
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 27),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: AppSVGAssets.getWidget(
          icon,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
