/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void cancel()
 * Cancels the timer.
 * @description Checks that non-periodic Timer is cancelled by cancel()
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int delay = 20;
  int count = 0;

  Timer timer = new Timer(durationMs(delay), () {
    count++;
    }
  );
  
  timer.cancel();
  
  asyncStart();
  new Timer(durationMs(delay*3), () {
    Expect.equals(count, 0);
    asyncEnd();
  });
  
}
