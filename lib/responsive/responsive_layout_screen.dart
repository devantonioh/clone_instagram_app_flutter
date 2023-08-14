import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clon/providers/user_provider.dart';
import 'package:instagram_clon/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScrreenLayout;
  final Widget mobileScrreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.webScrreenLayout,
    required this.mobileScrreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth > webScreenSize) {
        //web screen
        return widget.webScrreenLayout;
      }
      //mobile screen
      return widget.mobileScrreenLayout;
    });
  }
}
