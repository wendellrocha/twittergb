import 'package:dependencies/dependencies.dart';

class TextFieldStore extends Disposable {
  final RxNotifier<bool> _isVisible = RxNotifier<bool>(false);

  bool get isVisible => _isVisible.value;
  set isVisible(bool value) => _isVisible.value = value;

  @override
  void dispose() {
    _isVisible.dispose();
  }
}
