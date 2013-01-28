/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(onError(AsyncError asyncError), {bool test(Object error)})
 * Handles errors emitted by this Future.
 * Returns a new Future f.
 * @description Checks that several error handlers can be attached to the Future.
 * @author kaigorodov
 */

import "dart:async";

void onError1(AsyncError asyncError) {print("onError1: asyncError=$asyncError");}
void onError2(AsyncError asyncError) {print("onError2: asyncError=$asyncError");}

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  f.catchError(onError1);
  f.catchError(onError2);

  completer.completeError('!!!');
}
