/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamController.broadcast({void onListen(), void onCancel(), bool sync: false})
 * If sync is false, no guarantees are given with regard to when multiple listeners get the events,
 * except that each listener will get all events in the correct order.
 * @description checks that even sync is false, each listener will get all events in the correct order.
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  StreamController controller=new StreamController.broadcast();
  Stream stream=controller.stream;
  
  int event1=0;
  asyncStart();
  StreamSubscription sub1=stream.listen((event){
    Expect.equals(event1, event);
    event1++;
  },
  onDone: () {
    asyncEnd();
  });

  int event2=0;
  asyncStart();
  StreamSubscription sub2=stream.listen((event){
    Expect.equals(event2, event);
    event2++;
  },
  onDone: () {
    asyncEnd();
  });

  for (int k=0; k<10; k++) {
    controller.add(k);
  }
  controller.close();
}
