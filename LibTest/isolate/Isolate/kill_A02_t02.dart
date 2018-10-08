/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void kill({
 *    int priority: BEFORE_NEXT_EVENT
 *  })
 *   Requests the isolate to shut down.
 *   The isolate is requested to terminate itself. The priority argument
 * specifies when this must happen.
 *   The priority must be one of IMMEDIATE or BEFORE_NEXT_EVENT. The shutdown
 * is performed at different times depending on the priority:
 *      IMMEDIATE: The isolate shuts down as soon as possible. Control messages
 * are handled in order, so all previously sent control events from this
 * isolate will all have been processed. The shutdown should happen no later
 * than if sent with BEFORE_NEXT_EVENT. It may happen earlier if the system
 * has a way to shut down cleanly at an earlier time, even during the
 * execution of another event.
 *      BEFORE_NEXT_EVENT: The shutdown is scheduled for the next time control
 * returns to the event loop of the receiving isolate, after the current event,
 * and any already scheduled control events, are completed.
 *
 * @description Check that all previously sent control events are processed
 * before kill(BEFORE_NEXT_EVENT) terminates the isolate, which waits for events.
 *
 * @issue #28181
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort onExit = new ReceivePort();
  ErrorServer server = await ErrorServer.spawn(onExit:onExit.sendPort);

  Future pingFuture = ping(server.isolate, "ping", TWO_SECONDS);
  server.isolate.kill(priority:Isolate.beforeNextEvent);
  Expect.equals("ping", await pingFuture);
  await onExit.first;
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
