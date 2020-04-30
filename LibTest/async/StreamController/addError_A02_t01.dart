/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addError(Object error, [StackTrace stackTrace])
 * Send or enqueue an error event.
 *
 * The error must not be null.
 *
 * @description Checks that the error must not be null.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  Expect.throws(() {
    controller.addError(null);
  });
  controller.close();
}
