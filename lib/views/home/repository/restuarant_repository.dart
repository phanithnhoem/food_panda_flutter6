import 'package:food_panda6/data/network/api_service.dart';
import 'package:food_panda6/res/app_url.dart';
import 'package:food_panda6/views/home/models/restaurant.dart';

class RestaurantRepository {
  
  var apiService = ApiService();
  
  Future<Restaurant> getAllRestaurants() async {
    try{
      dynamic response = await apiService.getApi(AppUrl.getAllRestaurants);
      // print(response);
      return restaurantFromJson(response);
    }catch(exception) {
      rethrow;
    }
  }
}