/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController({void onListen(), void onPause(),
 *                  void onResume(), dynamic onCancel(), bool sync: false})
 * If onCancel needs to perform an asynchronous operation, onCancel should
 * return a future that completes when the cancel operation is done.
 *
 * @description Checks that stream subscription is cancelled only after
 * the Future returned by onCancel function is completed.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  bool onCancelFutureComplete = false;
  StreamController controller = new StreamController(
    onCancel: () => new Future.delayed(
      durationMs(100),
      () {
        onCancelFutureComplete = true;
      }
    )
  );

  Expect.isFalse(onCancelFutureComplete);
  StreamSubscription subs = controller.stream.listen((event) {});

  new Future(() => subs.cancel()).then(
    (_) {
      Expect.isTrue(onCancelFutureComplete);
      asyncEnd();
    }
  );
}
