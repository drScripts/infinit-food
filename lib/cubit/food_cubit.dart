import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_food/models/models.dart';
import 'package:infinit_food/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFood() async {
    ApiReturnValue<List<Food>> result = await FoodServices.getFood();
    if (result.value != null) {
      emit(FoodLoaded(food: result.value));
    } else {
      emit(FoodLoadingFailed(message: result.massage));
    }
  }
}
