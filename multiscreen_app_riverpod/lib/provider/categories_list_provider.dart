import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app_riverpod/data/dummmy_data.dart';

final categoriesProvider = Provider((ref){return categories;});