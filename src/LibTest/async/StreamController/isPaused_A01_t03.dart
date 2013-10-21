/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isPaused
 * Whether the subscription would need to buffer events.
 * A broadcast stream controller is never considered paused.
 * @description Checks that a broadcast stream controller is never considered paused.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller=new StreamController.broadcast();
  Expect.isFalse(controller.isPaused);
  
  List events1=new List();
  StreamSubscription ss=controller.stream.listen((event){events1.add(event);});
  Expect.isFalse(controller.isPaused);

  ss.pause();
  Expect.isFalse(controller.isPaused);
  
  controller.close();
}
