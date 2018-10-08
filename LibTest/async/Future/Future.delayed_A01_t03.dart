/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.delayed(Duration duration, [dynamic computation()])
 *    Creates a future that runs its computation after a delay.
 *    The computation will be executed after the given duration has passed, and
 * the future is completed with the result. If the duration is 0 or less, it
 * completes no sooner than in the next event-loop iteration.
 * @description Checks that if the duration is 0 or less, the future
 * completes no sooner than in the next event-loop iteration.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  bool computationStarted = false;
  asyncStart();
  new Future.delayed(Duration.zero, () {computationStarted = true;})
    .then((v) {
      Expect.isTrue(computationStarted);
      asyncEnd();
    });
  Expect.isFalse(computationStarted);
}
