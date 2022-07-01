// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// @assertion void kill({
///    int priority: BEFORE_NEXT_EVENT
///  })
///   Requests the isolate to shut down.
///   The isolate is requested to terminate itself. The priority argument
/// specifies when this must happen.
///   The priority must be one of IMMEDIATE or BEFORE_NEXT_EVENT. The shutdown
/// is performed at different times depending on the priority:
///      IMMEDIATE: The isolate shuts down as soon as possible. Control messages
/// are handled in order, so all previously sent control events from this
/// isolate will all have been processed. The shutdown should happen no later
/// than if sent with BEFORE_NEXT_EVENT. It may happen earlier if the system
/// has a way to shut down cleanly at an earlier time, even during the
/// execution of another event.
///      BEFORE_NEXT_EVENT: The shutdown is scheduled for the next time control
/// returns to the event loop of the receiving isolate, after the current event,
/// and any already scheduled control events, are completed.
///
/// @description Check that kill(priority: Isolate.beforeNextEvent) doesn't
/// terminate the continuously running isolate
///
/// @author sgrekhov@unipro.ru

import "dart:isolate";
import "dart:math";
import "../../../Utils/expect.dart";

entryPoint(SendPort message) {
  message.send("Started");
  Random random = new Random();
  int s = 0;
  while (true) {
    s = -s + random.nextInt(100);
  }
}

test() async {
  ReceivePort port = new ReceivePort();
  ReceivePort onExit = new ReceivePort();
  Isolate isolate = await Isolate.spawn(entryPoint, port.sendPort,
      onExit: onExit.sendPort, errorsAreFatal: true);
  await port.first;
  isolate.kill(priority: Isolate.beforeNextEvent);
  onExit.first.timeout(Duration(seconds: 3), onTimeout: () {
    // This is expected. Isolate shouldn't get killed
    isolate.kill(priority: Isolate.immediate);
    asyncEnd();
    return "Timeout";
  }).then((v) {
    // It there were no timeout then fail
    if (v != "Timeout") {
      Expect.fail("Isolate shouldn't get killed! Actual value ${v}");
    }
  });
}

main() {
  asyncStart();
  test();
}
