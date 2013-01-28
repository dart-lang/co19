/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void complete([T value])
 * Completes future with the supplied values. All listeners on the future will be
 * immediately informed about the value.
 * @description Checks that after [complete] is called without arguments, a value
 * in corresponding future is available and is equal to null.
 * @author kaigorodov
 */

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;

  completer.complete();
  
  future.then((fValue) {
    Expect.equals(fValue, null);
  });
}
