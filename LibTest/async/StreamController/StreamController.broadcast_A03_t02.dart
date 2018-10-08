/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * The controller does not have any internal queue of events, and if there
 * are no listeners at the time the event is added, it will just be dropped,
 * or, if it is an error, be reported as uncaught.
 *
 * @description Checks that errors are reported as uncaught if there are no
 * listeners.
 * @issue #29403
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController.broadcast();
  Expect.throws(() => controller.addError("lost event"));
  controller.close();
}
