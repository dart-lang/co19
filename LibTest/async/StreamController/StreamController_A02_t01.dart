/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController({void onListen(), void onPause(),
 *                  void onResume(), dynamic onCancel(), bool sync: false})
 * If sync is true, the returned stream controller is a
 * SynchronousStreamController, and must be used with the care and attention
 * necessary to not break the Stream contract. See Completer.sync for some
 * explanations on when a synchronous dispatching can be used. If in doubt,
 * keep the controller non-sync.
 *
 * @description Checks that if sync is false, the event will be passed to the
 * listener at a later time, after the code creating the event has returned.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController(sync: false);
  Stream s = controller.stream;
  bool onDataCalled = false;
  asyncStart();
  s.listen((var event) {
      onDataCalled = true;
      asyncEnd();
    }
  );
  controller.add(1);
  Expect.isFalse(onDataCalled);
  controller.close();
}
