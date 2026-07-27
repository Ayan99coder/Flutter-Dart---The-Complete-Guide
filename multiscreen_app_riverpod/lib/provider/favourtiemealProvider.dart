import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app_riverpod/model/meals_model.dart';
import 'package:multiscreen_app_riverpod/viewmodel/favourtie_notfier.dart';

final favMealProvider = NotifierProvider<FavouriteNotifier,List<MealsModel>>(FavouriteNotifier.new);