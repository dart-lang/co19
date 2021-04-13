/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Capability pause([
 *    Capability resumeCapability
 * ])
 *    Requests the isolate to pause.
 *    When the isolate receives the pause command, it stops processing events
 * from the event loop queue. It may still add new events to the queue in
 * response to, e.g., timers or receive-port messages. When the isolate is
 * resumed, it handles the already enqueued events.
 *
 * @description Check that pause(new Capability()) call stops processing events
 * from event loop queue
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";

const Duration pauseTime = const Duration(seconds: 10);

entryPoint(SendPort port) async {
  final sw = Stopwatch()..start();
  bool notified = false;
  while (true) {
    if (!notified) {
      port.send('in-loop');
      notified = true;
    }
    if (sw.elapsed.inSeconds >= pauseTime.inSeconds) {
      // We were probably paused, otherwise this loop would not stop executing
      // for 10 seconds.
      port.send('detected-pause');
      break;
    } else {
      sw..reset()..start();
      await Future.delayed(Duration(seconds: 1));
    }
  }
}

test() async {
  final onExit = ReceivePort();

  final rp = ReceivePort();
  final si = StreamIterator(rp);

  final isolate = await Isolate.spawn(entryPoint, rp.sendPort, onExit: onExit.sendPort);
  Expect.equals(true, await si.moveNext());
  Expect.equals('in-loop', si.current);

  final cap = isolate.pause(new Capability());
  await Future.delayed(pauseTime);
  isolate.resume(cap);
  Expect.equals(true, await si.moveNext());
  Expect.equals('detected-pause', si.current);

  si.cancel();
  rp.close();
  isolate.kill(priority: Isolate.immediate);
  await onExit.first;
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
