/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(Object error, [StackTrace stackTrace])
 * Send or enqueue an error event.
 *
 * @description Checks that an error event is created.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  var error0 = 12345;
  controller.addError(error0);
  asyncStart();
  controller.stream.listen(
    (value) {
      Expect.fail("unexpected onData call");
    },
    onError: (error1) {
      Expect.equals(error0, error1);
      asyncEnd();
    }
  );
  controller.close();
}
