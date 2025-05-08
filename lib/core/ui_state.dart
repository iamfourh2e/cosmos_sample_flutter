sealed class UiState<T> {
  const UiState();
}

final class Loading<T> extends UiState<T> {
  const Loading();
}

final class Complete<T> extends UiState<T> {
  final T data;
  const Complete(this.data);
}

final class Error<T> extends UiState<T> {
  final String message;
  const Error(this.message);
}