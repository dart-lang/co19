// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future get done
/// A future which is completed when the stream controller is done sending
/// events.
///
/// This happens either when the done event has been sent, or if the subscriber
/// on a single-subscription stream is canceled.
///
/// A stream controller will not complete the returned future until all
/// listeners present when the done event is sent have stopped listening. A
/// listener will stop listening if it is cancelled, or if it has handled the
/// done event. A paused listener will not process the done even until it is
/// resumed, so completion of the returned Future will be delayed until all
/// paused listeners have been resumed or cancelled.
///
/// If there is no listener on a non-broadcast stream, or the listener pauses
/// and never resumes, the done event will not be sent and this future will
/// never complete.
///
/// @description Checks that if the listener pauses and never resumes then the
/// done event is not sent and the future is never complete.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var stream = Stream<int>.multi((controller) {
    controller.done.then((_) {
      Expect.fail("Future unexpectedly completed");
    });
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.close();
  });
  listen(stream);
  listen(stream);
  // Wait for some time to make sure that the future is not completed
  Future.delayed(Duration(milliseconds: 100), asyncEnd);
}

void listen(Stream<int> stream) {
  late StreamSubscription ss;
  ss = stream.listen((v) {
    Expect.equals(1, v);
    ss.pause();
  }, onDone: () {
    Expect.fail("Unexpected onDone");
  });
}
