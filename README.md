Continue trying to run something on an interval until it succeeds or the timeout elapses.

## Usage

```dart
import 'package:tryhard/tryhard.dart';

continueTrying(function: () {
// doSomething throwable
}, timeout: 3000, interval: 50);
```
