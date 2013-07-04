/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isClosed
 * Whether the stream is closed for adding more events.
 * If true, the "done" event might not have fired yet, but it has been scheduled,
 * and it is too late to add more events.
 * @description Checks that the property returns correct value. Checks that an error is thrown if
 * more events added. A broadcast stream is checked.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  StreamController controller=new StreamController.broadcast();
  Expect.isFalse(controller.isClosed);
  
  StreamSubscription ss=controller.stream.listen((event){events1.add(event);});
  Expect.isFalse(controller.isClosed);

  controller.close();
  Expect.isTrue(controller.isClosed);
  
  try {
    controller.add(0);
    Expect.fail("add() works after close()");
  } catch (ok) {
  }
}
