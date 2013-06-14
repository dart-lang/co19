/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Timer.periodic(Duration duration, void callback(Timer timer))
 * Creates a new repeating timer.
 * The callback is invoked repeatedly with duration intervals until canceled.
 * @description Checks that callback finction is called repeatedly after the given duration.
 * @author kaigorodov
 */

import "dart:async";

import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  int delay=20;
  int times=5;
  int count=0;

  asyncStart();
  Timer timer=new Timer.periodic(durationMs(delay), (Timer timer) {
    count++;
    if (count==times) {
      timer.cancel();
      asyncEnd();
    }
  });
  
  asyncStart();
  new Timer(durationMs(delay*(times+1)), () {
    Expect.equals(count, times);
    asyncEnd();
  });
  
}

