/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * If sync is false, the event will always be fired at a later time, after
 * the code adding the event has completed. In that case, no guarantees are
 * given with regard to when multiple listeners get the events, except that
 * each listener will get all events in the correct order. Each subscription
 * handles the events individually. If two events are sent on an async
 * controller with two listeners, one of the listeners may get both events
 * before the other listener gets any. A listener must be subscribed both when
 * the event is initiated (that is, when add is called) and when the event is
 * later delivered, in order to receive the event.
 *
 * @description Checks that if sync is false, each listener will get all
 * events in the correct order.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController.broadcast();
  Stream stream = controller.stream;

  int event1 = 0;
  asyncStart();
  StreamSubscription sub1 = stream.listen(
    (event){
      Expect.equals(event1, event);
      event1++;
    },
    onDone: () {
      asyncEnd();
    }
  );

  int event2 = 0;
  asyncStart();
  StreamSubscription sub2 = stream.listen(
    (event){
      Expect.equals(event2, event);
      event2++;
    },
    onDone: () {
      asyncEnd();
    }
  );

  for (int k = 0; k < 10; k++) {
    controller.add(k);
  }
  controller.close();
}
