/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream errors
 *   Returns a broadcast stream of uncaught errors from the isolate.
 *   Each error is provided as an error event on the stream.
 *   The actual error object and stackTraces will not necessarily be the same
 * object types as in the actual isolate, but they will always have the same
 * Object.toString result.
 *   This stream is based on addErrorListener and removeErrorListener.
 *
 * @description Check that errors stream is a broadcast stream.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

void entryPoint(message) {
}

main() {
  asyncStart();
  Isolate.spawn(entryPoint, "hello").then(
    (Isolate isolate){
      Expect.isTrue(isolate.errors.isBroadcast, "errors should be a broadcast Stream");
      asyncEnd();
    }
  );
}
