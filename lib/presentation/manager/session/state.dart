part of 'provider.dart';

mixin _State {
  final session = _SessionData();
  //
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusSection.isLoadContent;
  // Setting the operation status.
  void _setActionsPage(ActionStatus value) => actionStatus = value;
}
