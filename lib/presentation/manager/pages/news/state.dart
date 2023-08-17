part of 'provider.dart';

mixin _State {
  // Basic page data.
  final pageData = _PageData();
  // Statuses of the list of news that are involved in updating the interface.
  final status = _StatusData();

  // These statuses are used to prevent the function from being
  // called again (if its previous call has not yet completed).
  // Not involved in UI updates.
  var actionStatus = ActionStatus.isDone;
  // Setting the operation status.
  void _setActionsPage(ActionStatus value) => actionStatus = value;
  //
  /// Performs a check for an error in receiving or generating data.
  bool _isFail(Failure? fail) {
    if (fail == null) return false;
    print(fail.msg); // Block for error logging.
    return true;
  }
}
