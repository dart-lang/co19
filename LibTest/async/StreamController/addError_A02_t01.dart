/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addError(Object error, [StackTrace stackTrace])
 * Send or enqueue an error event.
 *
 * If error is null, it is replaced by a NullThrownError.
 *
 * @description Checks that if an error is null, it is replaced by a
 * NullThrownError.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  controller.addError(null);
  asyncStart();
  controller.stream.listen(
    (value) {
      Expect.fail("unexpected onData call");
    },
    onError: (error1) {
      Expect.isTrue(error1 is NullThrownError);
      asyncEnd();
    }
  );
  controller.close();
}
