/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(Object error, [StackTrace stackTrace])
 * Send or enqueue an error event.
 *
 * @description Checks that addError with two parameters works correctly.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  var error0 = 12345;
  var stackTrace0;
  try {
    throw error0;
  } catch (e, st) {
    stackTrace0 = st;
    controller.addError(e, st);
  }
  asyncStart();
  controller.stream.listen(
    (value) {
      Expect.fail("unexpected onData call");
    },
    onError: (error1, stackTrace1) {
      Expect.identical(error0, error1);
      Expect.identical(stackTrace0, stackTrace1);
      asyncEnd();
    }
  );
  controller.close();
}
