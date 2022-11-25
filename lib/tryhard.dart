library tryhard;

Future<T?> continueTrying<T>(
    {int interval = 50,
    int timeout = 3000,
    int started = -1,
    required T Function() function}) async {
  if (started == -1) {
    started = DateTime.now().millisecondsSinceEpoch;
  }

  if (DateTime.now().millisecondsSinceEpoch - started >= timeout) {
    return null;
  }

  try {
    return function();
    // ignore: empty_catches
  } catch (ignored) {}

  return await Future.delayed(
      Duration(milliseconds: interval),
      () => continueTrying(
          interval: interval,
          timeout: timeout,
          started: started,
          function: function));
}
