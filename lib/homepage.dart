import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_bar/asset.dart';
import 'package:pizza_bar/details.dart';
import 'package:pizza_bar/home/homepage_drawer.dart';
import 'cartpage.dart';
import 'data.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShopeName(fontSize: 30, color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(236, 255, 255, 255),
      drawer: HomepageDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: color,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Get 30% Promo",
                        style: text(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 108, 48, 43),
                          padding: EdgeInsets.symmetric(
                            vertical: 22,
                            horizontal: 22,
                          ),
                        ),
                        child: Text(
                          'Redeem   ➜',
                          style: text(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Lottie.asset('asset/home.json')),
                ],
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: '  Search here...',
                hintStyle: text(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Food Menu',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 230,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(data: item[index]),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.grey, width: 2),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image.asset(item[index]['img']!)),
                            Text(
                              item[index]['name']!,
                              style: text(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              spacing: 50,
                              children: [
                                Text(
                                  item[index]['price']!,
                                  style: text(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  item[index]['rating']!,
                                  style: text(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Special Item',
              style: text(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset('asset/coffee.png', height: 90),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Text(
                        'Pizza Bar Special Coffee',
                        style: text(fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '﹩3.5',
                        style: text(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
