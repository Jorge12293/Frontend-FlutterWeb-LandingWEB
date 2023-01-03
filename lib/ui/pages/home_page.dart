import 'package:flutter/material.dart';
import 'package:landing/providers/page_provider.dart';
import 'package:landing/ui/shared/custom_app_menu.dart';

import 'package:landing/ui/views/about_view.dart';
import 'package:landing/ui/views/contact_view.dart';
import 'package:landing/ui/views/home_view.dart';
import 'package:landing/ui/views/location_view.dart';
import 'package:landing/ui/views/pricing_view.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu()
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.pink,
        Colors.purpleAccent
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5,0.5]
    )
  );

}

class _HomeBody extends StatelessWidget {
  _HomeBody();

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context,listen: false);
    
    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
