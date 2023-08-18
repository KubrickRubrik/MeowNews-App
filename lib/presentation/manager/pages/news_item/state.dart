part of 'provider.dart';

mixin _State {
  // Basic page data.
  final pageData = _PageData();

  // Not involved in UI updates.
  var actionStatus = ActionStatus.isDone;

  // Setting the operation status.
  void _setActionsPage(ActionStatus value) => actionStatus = value;

  /// Performs a check for an error in receiving or generating data.
  bool _isFail(Failure? fail) {
    if (fail == null) return false;
    _setActionsPage(ActionStatus.isDone);
    print(fail.msg); // Block for error logging.
    return true;
  }
}
