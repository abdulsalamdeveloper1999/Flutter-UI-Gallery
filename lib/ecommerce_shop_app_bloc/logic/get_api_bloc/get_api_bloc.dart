import 'dart:async';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../resources/app_urls.dart';
import '../models/product_model/product_model.dart';
import '../repository/api_repository.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  GetApiBloc() : super(GetApiInitial()) {
    on<FetchProductApiEvent>(_fetchApi);
  }

  FutureOr<void> _fetchApi(
    FetchProductApiEvent event,
    Emitter<GetApiState> emit,
  ) async {
    log('GetApiLoading emitted');
    emit(GetApiLoading());
    try {
      List<ProductModel> productList =
          await ApiRepository.getGetApi(AppUrls.products);
      log('GetApiLoaded emitted');
      emit(GetApiLoaded(products: productList));
    } catch (error) {
      // If an error occurs, emit the error event.
      log(error.toString());
      emit(GetApiError(error: 'An error occurred while fetching data$error.'));
    }
  }
}
