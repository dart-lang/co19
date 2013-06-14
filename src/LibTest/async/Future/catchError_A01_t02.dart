/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future catchError(onError(Object error), {bool test(Object error)})
 * Handles errors emitted by this Future.
 * Returns a new Future f.
 * @description Checks that several error handlers can be attached to the Future.
 * @author kaigorodov
 */

import "../../../Utils/async_utils.dart";
import "dart:async";

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
