/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 *    Handles errors emitted by this Future.
 *    This is the asynchronous equivalent of a "catch" block.
 *    Returns a new Future that will be completed with either the result of
 * this future or the result of calling the onError callback.
 * @description Checks that several error handlers can be attached to the Future.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

void onError1(Object asyncError) {
  asyncEnd();
}

void onError2(Object asyncError) {
  asyncEnd();
}

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  f.catchError(onError1);
  f.catchError(onError2);

  asyncMultiStart(2);
  completer.completeError('!!!');
}
