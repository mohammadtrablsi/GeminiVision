import 'package:flutter/material.dart';

class RoundedContainerWithIcon extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const RoundedContainerWithIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0XFF9DB2BF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}