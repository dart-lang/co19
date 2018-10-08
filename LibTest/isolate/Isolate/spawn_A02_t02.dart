/*
 * Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawn(void entryPoint(message), message,
 * {bool paused: false, bool errorsAreFatal, SendPort onExit, SendPort onError})
 *
 *    The argument entryPoint specifies the entry point of the spawned isolate.
 * It must be a top-level function or a static method that takes one argument -
 * that is, one-parameter functions that can be compile-time constant function
 * values. It is not allowed to pass the value of function expressions or
 * an instance method extracted from an object.
 *
 *    The entry-point function is invoked with the initial message. Usually
 * the initial message contains a SendPort so that the spawner and spawnee can
 * communicate with each other.
 *  ...
 *    Returns a future that will complete with an Isolate instance if
 * the spawning succeeded. It will complete with an error otherwise.
 *
 * @description Checks that if entryPoint is null, then returned Future
 * instance completes with error
 *
 * @author iefremov
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  Isolate.spawn(null, "hello").then(
    (v) {
      Expect.fail("Isolate.spawn(null, 'hello') is expected to fail");
    },
    onError: (e) {
//      print("Error: $e");
      asyncEnd();
    }
  );
}
