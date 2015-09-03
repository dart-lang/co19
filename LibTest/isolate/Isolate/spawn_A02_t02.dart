/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawn(void entryPoint(message), message)
 * The argument entryPoint specifies the entry point of the spawned isolate.
 * It must be a static top-level function or a static method that takes no arguments.
 * It is not allowed to pass a function closure.
 * The entry-point function is invoked with the initial message.
 * Returns a future that will complete with an Isolate instance.
 * @description Checks that method throws an exception when passed null,
 * an integer, or a string.
 * @author iefremov
 * @needsreview documentation looks incomplete
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

var x = null;

main() {
  Expect.throws(() => Isolate.spawn(null, 1));
  Expect.throws(() => Isolate.spawn(x, 1));
  x = 1;
  Expect.throws(() => Isolate.spawn(x, 1));
  x = "";
  Expect.throws(() => Isolate.spawn(x, 1));
}
