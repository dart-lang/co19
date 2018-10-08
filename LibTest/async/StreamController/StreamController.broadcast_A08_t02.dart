/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * If a listener is added again later, after the onCancel was called, the
 * onListen will be called again.
 *
 * @description Checks that onListen is called each time first listener
 * subscribes and onCancel is called each time the last listener unsubscribes.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

List<StreamSubscription> subscribe(StreamController controller, int count) {
  return new List.generate(
    count,
    (_) => controller.stream.listen((event) {})
  );
}

Future unsubscribe(List<StreamSubscription> subscriptions, int count) {
  count--;
  return new Future.delayed(
    durationMs(50),
    () => subscriptions[count].cancel()
  ).then (
    (_) {
      if (count>0) {
        return unsubscribe(subscriptions, count);
      }
    }
  );
}

main() {
  List log = [];
  int listenCount = 0;
  int cancelCount = 0;
  StreamController controller = new StreamController.broadcast(
    onListen: () {
      log.add("L");
      log.add(listenCount++);
    },
    onCancel:() {
      log.add("C");
      log.add(cancelCount++);
    }
  );
  List expectedLog = ["L", 0, "C", 0, "L", 1, "C", 1, "L", 2, "C", 2];
  asyncStart();
  unsubscribe(subscribe(controller, 3), 3).then(
    (_) {
      unsubscribe(subscribe(controller, 5), 5).then(
        (_){
          unsubscribe(subscribe(controller, 4), 4).then(
            (_) {
                Expect.listEquals(expectedLog, log);
                asyncEnd();
              }
          );
        }
      );
    }
  );
}
