/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(T event)
 * Create a data event
 * @description Checks that a data event is created.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  StreamController controller=new StreamController();
  var value0=12345;
  controller.add(value0);
  asyncStart();
  controller.stream.listen((value1) {
    Expect.equals(value0, value1);
  },
  onDone:() {
    asyncEnd();
  });
  controller.close();
}
