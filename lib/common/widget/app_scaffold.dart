import 'package:flutter/material.dart';
import 'package:jcc_admin/common/widget/bottom_navigation_bar.dart';
import 'package:jcc_admin/common/widget/scroll_to_hide_widget.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.child,
    required this.controller,
    required this.bottomNavKey,
  });

  final ScrollController controller;
  final Widget child;
  final GlobalKey<ScrollToHideWidgetState> bottomNavKey;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            widget.child,
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: ScrollToHideWidget(
                key: widget.bottomNavKey,
                controller: widget.controller,
                child: Wrap(children: [AppBottomNavigationBar()]),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: AppBottomNavigationBar(),
      // bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
