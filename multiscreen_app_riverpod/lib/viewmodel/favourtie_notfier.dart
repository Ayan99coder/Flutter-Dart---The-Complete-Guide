import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app_riverpod/model/meals_model.dart';

class FavouriteNotifier extends Notifier<List<MealsModel>> {
  @override
  List<MealsModel> build() {
    return [];
  }
  void toggleFavouriteList(MealsModel meals){
    bool isFavourite = state.any((e)=> e.id == meals.id);
    if(isFavourite){
      state = state.where((m) => m.id != meals.id).toList();
    }else{
      state = [...state , meals];
    }

  }
  bool isFavourite(MealsModel model){
    return state.any((e)=> e.id == model.id);
  }
}
