import 'dart:async';


enum SwitchItem { LIST, GRID }

class SwitchBloc {
  final StreamController<SwitchItem> _switchController = StreamController<SwitchItem>();

  SwitchItem defaultItem = SwitchItem.LIST;

  Stream<SwitchItem> get itemStream => _switchController.stream;

  void showList() {
    _switchController.sink.add(SwitchItem.LIST);
  }

  void showGrid() {
    _switchController.sink.add(SwitchItem.GRID);
  }
  close(){
    _switchController.close();
  }
}

final switchBloc = SwitchBloc();
