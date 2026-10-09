import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherWay extends StatelessWidget {
  const OtherWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          //  Divider
          Row(
            children: [
              const Expanded(
                child: Divider(thickness: 0.8, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'or continue with',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(thickness: 0.8, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 16),

          //  Social buttons
          Row(
            children: [
              Expanded(
                child: _SocialBtn(
                  label: 'Google',
                  icon: SvgPicture.asset(
                    'assets/auth_icons/google.svg',
                    height: 24,
                  ),
                  onTap: () {
                    // BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SocialBtn(
                  label: 'Apple',
                  icon: const Icon(
                    Icons.apple_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const _SocialBtn({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.grey.shade100.withAlpha(120),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade400.withAlpha(120),
            width: 0.8,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                // color: _kGray900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
