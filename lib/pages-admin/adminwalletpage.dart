import 'package:flutter/material.dart';
import 'package:turfbooking/colors/colors.dart';
class adminwallet extends StatefulWidget {
  const adminwallet({super.key});

  @override
  State<adminwallet> createState() => _adminwalletState();
}

class _adminwalletState extends State<adminwallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(20),
        child: AppBar(
          backgroundColor: entireapp,
        ),
      ),
    );
  }
}
