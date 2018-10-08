/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController({void onListen(), void onPause(),
 *                  void onResume(), dynamic onCancel(), bool sync: false})
 * onResume is called when the stream resumed.
 * @description Checks that the onResume function is called when the stream
 * resumed.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  bool onResumeCalled = false;
  asyncStart();
  StreamController controller = new StreamController(
    onResume: () {
      onResumeCalled = true;
      asyncEnd();
    }
  );

  StreamSubscription subs = controller.stream.listen((event) {});
  controller.add(1);

  subs.pause();
  Expect.isFalse(onResumeCalled);

  subs.resume();
}
