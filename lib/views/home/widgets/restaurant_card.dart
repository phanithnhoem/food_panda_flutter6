import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda6/res/app_url.dart';
import 'package:food_panda6/views/home/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {

  RestaurantCard({
    this.restaurant
  });

  Datum? restaurant;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16),
      width: MediaQuery.of(context).size.width * 0.75,
      height: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: Colors.greenAccent
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                      '${AppUrl.baseUrl}${restaurant!.attributes!.picture!.data!.attributes!.url}',
                  height: 220,
                    width: MediaQuery.of(context).size.width * 0.75,
                    fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  top: 15,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8)
                        )
                    ),
                    child: Text(
                      '15% OFF',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  )
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      '25mn',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  )
              )
            ],
          ),
          SizedBox(height: 8,),
          Text(
            restaurant!.attributes!.name.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          Text('\$\$\$ ${restaurant!.attributes!.category}'),
          Text('\$ ${restaurant!.attributes!.deliveryFee} delivery'),
        ],
      ),

    );
  }
}
