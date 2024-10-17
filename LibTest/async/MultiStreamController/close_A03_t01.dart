// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future close()
/// Closes the stream.
///
/// No further events can be added to a closed stream.
///
/// The returned future is the same future provided by [done]. It is completed
/// when the stream listeners is done sending events. This happens either when
/// the done event has been sent, or when the subscriber on a
/// single-subscription stream is canceled.
///
/// A stream controller will not complete the returned future until all
/// listeners present when the done event is sent have stopped listening. A
/// listener will stop listening if it is cancelled, or if it has handled the
/// done event. A paused listener will not process the done even until it is
/// resumed, so completion of the returned Future will be delayed until all
/// paused listeners have been resumed or cancelled.
///
/// If no one listens to a non-broadcast stream, or the listener pauses and
/// never resumes, the done event will not be sent and this future will never
/// complete.
///
/// @description Checks that the returned future is completed not earlier wnen
/// its listener is cancelled.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

var results = List<bool>.filled(4, false);
var controllers = Map<MultiStreamController<int>, int>();

main() {
  asyncStart(4);
  int counter = 0;
  var stream = Stream<int>.multi((controller) {
    controllers[controller] = counter++;
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.close();
    controller.close().then((_) {
      int i = controllers[controller]!;
      Expect.isTrue(results[i], " Listener number $i is not cancelled yet");
      asyncEnd();
    });
  });
  listen(0, stream);
  listen(1, stream);
  listen(2, stream);
  listen(3, stream);
}

void listen(int index, Stream<int> stream) {
  late StreamSubscription ss;
  ss = stream.listen((v) {
    Expect.equals(1, v);
    ss.cancel();
    results[index] = true;
  });
}
