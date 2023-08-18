part of '../provider.dart';

final class _NewsBar {
  String _searchWord = 'IT';
  var statusOpen = false;

  void _setStatusOpen(bool? val) {
    if (val != null) {
      statusOpen = val;
    } else {
      statusOpen = !statusOpen;
    }
  }

  String getSearchString() {
    return _searchWord.isEmpty ? 'IT' : _searchWord;
  }

  void _setSearchWord(String val) {
    _searchWord = val;
  }
}
