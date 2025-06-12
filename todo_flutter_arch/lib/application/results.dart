class Result<T> {
  final T? value;
  final Object? error;
  final bool isLoading;

  Result.success(this.value) : error = null, isLoading = false;
  Result.error(this.error) : value = null, isLoading = false;
  Result.isLoading() : value = null, error = null, isLoading = true;

  bool get isSuccess => error == null && !isLoading;
  bool get isError => error != null;
}
