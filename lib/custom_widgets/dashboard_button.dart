
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {

  final String label;
  final Color color ;
  final VoidCallback onPressed;

  DashboardButton({
    required this.label,
    this.color = Colors.brown,
    required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Center(child: Text(label,style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 16),)),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8)
        ),
      ),
    );
  }
}
