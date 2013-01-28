/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void complete([T value])
 * Completes future with the supplied values. All listeners on the future will be
 * immediately informed about the value.
 * @description Checks that single listener on the future is informed immediately.
 * @author kaigorodov
 */

import "dart:async";

var listened;

main() {
  var completer = new Completer();
  var future = completer.future;

  future.then((fValue) {
     listened=fValue;
  });

  completer.complete(1);
  Expect.equals(1, listened);
  
}
