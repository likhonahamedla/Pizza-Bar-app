import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_bar/asset.dart';
import 'package:pizza_bar/data.dart';

class HomepageDrawer extends StatelessWidget {
  const HomepageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 300,
            child: DrawerHeader(
              decoration: BoxDecoration(color: color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'asset/shop.json',
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  ShopeName(fontSize: 25),
                ],
              ),
            ),
          ),
          Text(
            'Our Branches:',
            style: text(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Divider(thickness: 2),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.location_on_outlined, size: 30),
                title: Text(
                  area[index],
                  style: text(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: area.length,
          ),
        ],
      ),
    );
  }
}
