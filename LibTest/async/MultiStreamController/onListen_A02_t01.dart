// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void Function()? onListen
///
/// The callback which is called when the stream is listened to.
///
/// May be set to null, in which case no callback will happen.
///
/// @description Checks that setting `onListen` to `null` has no effect in case
/// of [MultiStreamController].
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    controller.onListen = null;
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.close();
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  stream.listen((v) {
  }, onDone: asyncEnd);
}
