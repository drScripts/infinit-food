import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_food/models/models.dart';
import 'package:infinit_food/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async {
    ApiReturnValue<List<Transaction>> result = await TransactionServices.getTransactions();
    if (result.value != null) {
      emit(TransactionLoaded(transaction: result.value));
    } else {
      emit(TransactionFailedLoading(message: result.massage));
    }
  }

  Future<String> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result = await TransactionServices.getSingleTransaction(transaction);

    if (result.value != null) {
      emit(
        TransactionLoaded(transaction: (state as TransactionLoaded).transaction + [result.value]),
      );
      return result.value.url;
    } else {
      return null;
    }
  }
}
