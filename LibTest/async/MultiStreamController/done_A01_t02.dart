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
/// @description Checks that this getter returns a future which is completed
/// when the subscriber is cancelled.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    controller.done.then((_) {
      asyncEnd();
    });
    controller.add(1);
    controller.add(2);
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  late StreamSubscription ss;
  ss = stream.listen((v) {
    ss.cancel();
  });
}
