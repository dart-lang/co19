/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * If a listener is added again later, after the onCancel was called, the
 * onListen will be called again.
 *
 * @description Checks that if a listener is added again later, after the
 * onCancel was called, the onListen will be called again.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  bool onListenCalled = false;
  bool onCancelCalled = false;
  asyncMultiStart(4);

  StreamController controller = new StreamController.broadcast(
    onListen: () {
      onListenCalled = true;
      asyncEnd();
    },
    onCancel: () {
      onCancelCalled = true;
      asyncEnd();
    }
  );
  Stream stream = controller.stream;

  Expect.isFalse(onListenCalled);
  StreamSubscription subs = stream.listen((event){});
  Expect.isTrue(onListenCalled);

  subs.cancel();
  Expect.isTrue(onCancelCalled);

  onListenCalled = false;
  subs=stream.listen((event) {});
  Expect.isTrue(onListenCalled);

  controller.close();
}

