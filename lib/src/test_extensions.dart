import 'dart:async';

import 'package:async_plus/async_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

/// UnitTest用のZonedGuardedでラップする
void setUpBody(Future Function() body) {
  setUp(() async {
    await runZonedGuarded(body, _zoneErrorHandler);
  });
}

/// UnitTest用のZonedGuardedでラップする
void setUpAllBody(Future Function() body) {
  setUpAll(() async {
    await runZonedGuarded(body, _zoneErrorHandler);
  });
}

/// UnitTest用のZonedGuardedでラップする
void tearDownBody(Future Function() body) {
  tearDown(() async {
    await runZonedGuarded(body, _zoneErrorHandler);
  });
}

/// UnitTest用のZonedGuardedでラップする
void tearAllDownBody(Future Function() body) {
  tearDownAll(() async {
    await runZonedGuarded(body, _zoneErrorHandler);
  });
}

/// UnitTest用のZonedGuardedでラップする
dynamic Function() testBody(Future Function() body) {
  return () async {
    await runZonedGuarded(body, _zoneErrorHandler);
  };
}

void _zoneErrorHandler(dynamic e, StackTrace stack) {
  if (e is CancellationException) {
    // drop error;
    return;
  }
  if (kDebugMode) {
    print('error: $e');
    print('stacktrace: $stack');
  }
  fail('$e');
}
