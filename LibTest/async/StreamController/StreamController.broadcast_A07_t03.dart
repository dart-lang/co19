/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * The onListen callback is called when the first listener is subscribed,
 * and the onCancel is called when there are no longer any active listeners.
 *
 * @description Checks that the onCancel function is called when the last
 * listener unsubscribes.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int onCancelCallCount = 0;
  asyncMultiStart(6);
  StreamController controller;
  controller = new StreamController.broadcast(
    onCancel: () {
      onCancelCallCount++;
      Expect.equals(1, onCancelCallCount);
      asyncEnd();
      controller.close();
    }
  );
  List<StreamSubscription> subscriptions = new List.generate(
    5,
    (_) => controller.stream.listen((event) {})
  );

  int i = 0, k = 0;
  new Timer.periodic(durationMs(100), (Timer timer) {
    new Future.value(subscriptions[i].cancel()).then(
      (_) {
        Expect.equals((++k < 5) ? 0 : 1, onCancelCallCount);
        asyncEnd();
      }
    );
    i++;
    if (i==5) {
      timer.cancel();
    }
  });
}
