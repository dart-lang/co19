// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void Function()? onResume
/// The callback which is called when the stream is resumed.
///
/// May be set to `null`, in which case no callback will happen.
///
/// Pause related callbacks are not supported on broadcast stream controllers.
///
/// @description Checks that if this callback is is not called after "done"
/// event.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    Expect.isNull(controller.onResume);
    controller.onResume = () {
      // See https://github.com/dart-lang/sdk/issues/56927 for an explanation.
      Expect.fail("Unexpected onResume");
    };
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.close();
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  late StreamSubscription ss;
  int i = 0;
  ss = stream.listen((v) {
    Expect.equals(++i, v);
    if (i == 1) {
      ss.pause();
      Future.delayed(Duration(milliseconds: 100), () {
        ss.resume();
      });
    }
  }, onDone: asyncEnd);
}
