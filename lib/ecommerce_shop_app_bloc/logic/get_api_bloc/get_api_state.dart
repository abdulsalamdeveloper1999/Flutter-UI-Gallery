part of 'get_api_bloc.dart';

@immutable
sealed class GetApiState {}

final class GetApiInitial extends GetApiState {}

final class GetApiLoading extends GetApiState {}

final class GetApiLoaded extends GetApiState {
  final List<ProductModel> products;

  GetApiLoaded({required this.products});
}

final class GetApiError extends GetApiState {
  final String error;

  GetApiError({required this.error});
}
