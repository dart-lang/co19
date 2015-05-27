/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.sync(computation())
 * Creates a future containing the result of immediately calling computation.
 * if the result of executing computation throws, the returned future is completed with the error.
 * If the returned value is itself a Future, completion of the created future
 * will wait until the returned future completes, and will then complete with the same result.
 * @description Checks that computation() is done synchronously.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var x;
  new Future.sync(() => x=1);
  Expect.equals(1, x);
}
