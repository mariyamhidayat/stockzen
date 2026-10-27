enum ShellStatus { loading, ready, error }

class ShellViewModel {
  const ShellViewModel.loading()
    : status = ShellStatus.loading,
      errorMessage = null;

  const ShellViewModel.ready()
    : status = ShellStatus.ready,
      errorMessage = null;

  const ShellViewModel.error()
    : status = ShellStatus.error,
      errorMessage = 'StockZen could not start.';

  final ShellStatus status;
  final String? errorMessage;
}
