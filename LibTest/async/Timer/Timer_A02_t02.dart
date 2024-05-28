// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion factory Timer(Duration duration, void callback())
///
/// A negative duration is treated the same as [Duration.zero]
///
/// @description Checks that negative duration is accepted and treated as
/// [Duration.zero]. Test that timer waits for microtask queue before the start
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

const maxMicrotasks = 10;
int microtasksCount = 0;

void microtask() {
  if (++microtasksCount < maxMicrotasks) {
    scheduleMicrotask(microtask);
  }
}

Future<void> check(int durationInMs, int n) {
  Completer<void> completer = Completer();

  scheduleMicrotask(microtask);

  Timer(Duration(milliseconds: durationInMs), () {
    Expect.equals(maxMicrotasks, microtasksCount);
    microtasksCount = 0;
    completer.complete();
    asyncEnd();
  });
  return completer.future;
}

main() async {
  asyncStart(4);
  await check(0, 5);
  await check(-10, 5);
  await check(-100, 5);
  await check(-500, 3);
}
