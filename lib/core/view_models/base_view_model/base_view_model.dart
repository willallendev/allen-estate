import 'dart:developer';

import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/async_state.dart';
import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:flutter/foundation.dart';

const String _tag = '[BaseViewModel] -';

class BaseViewModel extends ChangeNotifier {
  Map<String, ViewModelStatePiece> _state = {};

  Map<String, ViewModelStatePiece> get state => _state;

  void createStatePiece<T>(
    key, {
    T data,
    Map<String, dynamic> meta,
    PaginationData pagination,
    AsyncState state = AsyncState.initial,
    Function onLoading,
    Function onSuccess,
    Function onError,
  }) {
    _state.putIfAbsent(
        key,
        () => ViewModelStatePiece<T>(
              data: data,
              meta: meta,
              pagination: pagination,
              state: state,
              onLoading: onLoading,
              onSuccess: onSuccess,
              onError: onError,
            ));
  }

  void mapFutureResultToState<T>({@required String key, _ResultGenerator<T> resultGenerator}) async {
    _state.putIfAbsent(key, () => ViewModelStatePiece<T>());
    AsyncResult<T> result;
    DateTime timeId = new DateTime.now();

    mapTimeToState(key, timeId);
    mapLoadingToState(key);
    notifyListeners();

    try {
      result = resultGenerator != null ? await resultGenerator() : null;
      mapSuccessToState(key);

      if (result?.data != null && timeId.isAtSameMomentAs(_state[key].dateTime)) {
        mapDataToState<T>(key, result.data);
      }
      if (result?.meta != null && timeId.isAtSameMomentAs(_state[key].dateTime)) {
        mapMetaToState(key, result.meta);
      }
      if (result?.pagination != null && timeId.isAtSameMomentAs(_state[key].dateTime)) {
        mapPaginationToState(key, result.pagination);
      }
      notifyListeners();
    } on NotFoundException {
      log('$_tag no found');
      if (timeId.isAtSameMomentAs(_state[key].dateTime)) {
        mapNotFoundToState(key);
        notifyListeners();
      }
    } on NoResultsException {
      if (timeId.isAtSameMomentAs(_state[key].dateTime)) {
        mapNoResultsToState(key);
        notifyListeners();
      }
    } catch (e, stackTrace) {
      log('$_tag onError: \'${e.message}\' on resultGenerator for state-piece:\'$key\' \nstackTrace: $stackTrace');
      if (timeId.isAtSameMomentAs(_state[key].dateTime)) {
        String errorMsg = e != null ? '$e' : '';
        mapErrorToState(key, errorMsg);
        notifyListeners();
      }
    }
  }

  void mapSuccessToState(String key) {
    _state[key].state = AsyncState.done;
    _state[key].onSuccess?.call();
  }

  void mapNotFoundToState(String key) {
    _state[key].state = AsyncState.notFound;
  }

  void mapNoResultsToState(String key) {
    _state[key].state = AsyncState.notResults;
  }

  void mapErrorToState(String key, String error) {
    _state[key].state = AsyncState.error;
    _state[key].error = error;
    _state[key].onError?.call();
  }

  void mapLoadingToState(String key) {
    _state[key].state = AsyncState.loading;
    _state[key].onLoading?.call();
  }

  void mapDataToState<T>(String key, T data) => _state[key].data = data;

  void mapMetaToState(String key, meta) => _state[key].meta = meta;

  void mapPaginationToState(String key, PaginationData pagination) => _state[key].pagination = pagination;

  void mapTimeToState(String key, DateTime dateTime) => _state[key].dateTime = dateTime;

  void logState() {
    log('$_tag _state: ');
    _state.forEach((String key, ViewModelStatePiece value) {
      log('$key:');
      log(value.toString());
    });
  }
}

typedef _ResultGenerator<T> = Future<AsyncResult<T>> Function();

class ViewModelStatePiece<T> {
  T data;
  Map<String, dynamic> meta;
  AsyncState state;
  String error;
  PaginationData pagination;
  DateTime dateTime;
  Function onLoading;
  Function onSuccess;
  Function onError;

  ViewModelStatePiece({
    this.data,
    this.meta,
    this.state = AsyncState.initial,
    this.error,
    this.pagination,
    this.dateTime,
    this.onLoading,
    this.onSuccess,
    this.onError,
  });

  @override
  String toString() {
    return '_ViewModelStatePiece{data: $data, meta: $meta, state: $state, pagination: $pagination, dateTime: $dateTime}';
  }
}

class NotFoundException implements Exception {
  final message = 'No found';
}

class NoResultsException implements Exception {
  final message = 'No results found';
}
