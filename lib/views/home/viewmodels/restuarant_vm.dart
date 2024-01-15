import 'package:flutter/cupertino.dart';
import 'package:food_panda6/data/response/api_response.dart';
import 'package:food_panda6/views/home/models/restaurant.dart';
import 'package:food_panda6/views/home/repository/restuarant_repository.dart';

class RestaurantViewModel extends ChangeNotifier {

  var _restuarantRepo = RestaurantRepository();
  ApiResponse<Restaurant> response = ApiResponse.loading();

  setRestaurantList(response) {
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> gerAllRestaurants() async {
    await _restuarantRepo.getAllRestaurants()
        .then((restaurant) => setRestaurantList(ApiResponse.completed(restaurant)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(stackTrace.toString())));
        
  }
}