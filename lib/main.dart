import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecomapp/components/horizontal_listview.dart';
import 'package:ecomapp/components/products.dart';
import 'package:ecomapp/pages/cart.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5,
        dotBgColor: Colors.transparent,
        // dotColor: Colors.red,
        indicatorBgPadding: 2,
      ),
    );
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: Text('Market at Home'),
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
            )
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text('Divyanshi Singh'),
                accountEmail: Text('divyanshipilot@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                decoration: new BoxDecoration(color: Colors.red),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home, color: Colors.red),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My accounts'),
                  leading: Icon(Icons.person, color: Colors.red),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My orders'),
                  leading: Icon(Icons.shopping_basket, color: Colors.red),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Cart()));
                },
                child: ListTile(
                  title: Text('Shopping cart'),
                  leading: Icon(Icons.shopping_cart, color: Colors.red),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Favourites'),
                  leading: Icon(Icons.favorite, color: Colors.red),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.help, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: new ListView(
          children: <Widget>[
            imageCarousel,
            new Padding(
              padding: const EdgeInsets.all(8),
              child: new Text('Categories'),
            ),
            HorizontalList(),
            new Padding(
              padding: const EdgeInsets.all(20),
              child: new Text('Recent products'),
            ),
            // Products(),
            Container(
              height: 320,
              child: Products(),
            )
          ],
        ));
  }
}
