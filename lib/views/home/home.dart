import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_panda6/data/response/status.dart';
import 'package:food_panda6/views/business_owner/add_restaurant.dart';
import 'package:food_panda6/views/home/skeletons/restaurant_skeleton.dart';
import 'package:food_panda6/views/home/viewmodels/restuarant_vm.dart';
import 'package:food_panda6/views/home/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

import 'widgets/drawer.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final boxDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8));

  var _restaurantViewModel = RestaurantViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _restaurantViewModel.gerAllRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2 St 24', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
            Text('Phnom Penh', style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        // leadingWidth: 35,
        actions: [
          IconButton(onPressed: (){
            print('Favorite icon pressed!');
                }, icon: Icon(Icons.favorite, color: Colors.white,)),
          IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddRestaurant()),
            );
          }, icon: Icon(Icons.shopping_cart, color: Colors.white,))
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              // height: 220,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Food Delivery', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  Text('Order food you love', style: TextStyle(fontSize: 14),),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/food-panda-careers.png',
                        fit: BoxFit.cover,
                        // width: 60,
                        height: 60,
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.all(10),
                      decoration: boxDecoration,
                      height: 260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Groceries',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text('Supermarkets,Marts, Shops, & more',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/images/food-panda.png',
                              width: 120,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 260,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, bottom: 5),
                                padding: EdgeInsets.all(10),
                                decoration: boxDecoration,
                                height: 260,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pick-up',
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Text('Up to 50% off',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        'assets/images/food-panda.png',
                                        width: 80,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex:  1,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 5),
                                padding: EdgeInsets.all(10),
                                decoration: boxDecoration,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'pandasend',
                                            style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                          Text('Send parcels in a tap',
                                              style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          'assets/images/food-panda.png',
                                          width: 56,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.white,
              child: SizedBox(
                height: 340,
                child: ChangeNotifierProvider(
                  create: (context) => _restaurantViewModel,
                  child: Consumer<RestaurantViewModel>(
                    builder: (context, viewModel, _) {
                      switch(viewModel.response.status!){
                        case Status.LOADING:
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) => RestaurantCardSkeleton()
                          );
                        case Status.COMPLETED:
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                var restaurant = viewModel.response.data!.data![index];
                                return RestaurantCard(restaurant: restaurant);
                              }
                          );
                        case Status.ERROR:
                          return Text("OnError()");
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

