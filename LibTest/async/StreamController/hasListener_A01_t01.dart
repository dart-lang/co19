/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasListener
 * Whether there is a subscriber on the Stream.
 * @description Checks that the property returns correct value.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  Stream s = controller.stream;
  Expect.isFalse(controller.hasListener);

  List events1 = new List();
  StreamSubscription ss = s.listen((event) {events1.add(event);});
  Expect.isTrue(controller.hasListener);

  ss.cancel();
  Expect.isFalse(controller.hasListener);

  controller.close();
}
