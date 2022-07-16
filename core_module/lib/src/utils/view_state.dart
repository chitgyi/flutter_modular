import 'package:flutter/material.dart';

enum ViewState { loading, success, failed }

abstract class BaseState<T> {
  final T? value;
  final ViewState viewState;
  final String? errorMessage;

  BaseState({
    this.value,
    required this.viewState,
    this.errorMessage,
  });

  BaseState.loading()
      : value = null,
        viewState = ViewState.loading,
        errorMessage = null;

  BaseState.success(this.value)
      : viewState = ViewState.success,
        errorMessage = null;

  BaseState.failed(this.errorMessage)
      : value = null,
        viewState = ViewState.failed;

  Widget observe(
    Widget Function(T value) onSuccess, {
    Widget Function(String errorMessage)? onError,
    Widget Function()? onLoading,
  }) {
    switch (viewState) {
      case ViewState.success:
        return onSuccess(value as T);
      case ViewState.failed:
        return onError == null
            ? Center(
                child: Text(errorMessage!),
              )
            : onError.call(errorMessage!);
      case ViewState.loading:
        return onLoading == null
            ? const Center(child: CircularProgressIndicator())
            : onLoading.call();
    }
  }
}
