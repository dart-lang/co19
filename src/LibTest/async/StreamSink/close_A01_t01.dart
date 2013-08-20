/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract Future close()
 * Close the StreamSink. It'll return the done Future.
 * @description Checks that the method returns the done Future.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  StreamController controller=new StreamController();
  var error0=12345;
  controller.addError(error0);
  asyncStart();
  controller.stream.listen((value) {
    Expect.fail("unexpected onData call");
  },
  onError:(error1) {
    Expect.equals(error0, error1);
  },
  onDone:() {
    asyncEnd();
  });
  controller.close();
}
