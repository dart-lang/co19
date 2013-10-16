/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.value([value])
 * A future whose value is available in the next event-loop iteration.
 * If value is not a Future, using this constructor is equivalent to
 * new Future<T>.sync(() => value).
 * @description Checks that [value] is an optional parameter.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Future future = new Future.value();
  
  asyncStart();
  future.then((fValue) {
    Expect.equals(null, fValue);
    asyncEnd();
  });
}
