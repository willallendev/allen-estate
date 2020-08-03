const _tag = '[DevAsyncSettings] -';

class DevAsyncSettings {
  final bool fail;
  final Duration timeout;

  DevAsyncSettings({
    this.fail = false,
    this.timeout = const Duration(seconds: 1),
  })  : assert(fail != null, '$_tag fail can not be null'),
        assert(timeout != null, '$_tag timeout can not be null');

  @override
  String toString() {
    return 'DevAsyncSettings{fail: $fail, timeout: $timeout}';
  }
}
