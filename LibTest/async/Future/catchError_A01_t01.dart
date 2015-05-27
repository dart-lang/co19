/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future catchError(Function onError, {bool test(Object error)})
 * Handles errors emitted by this Future.
 * Returns a new Future f.
 * @description Checks that [catchError] returns a new Future f.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

void onError(Object asyncError) {}

void check (Future f1) {
  Future f2=f1.catchError(onError);
  Expect.isTrue(f2 is Future);
  Expect.isFalse(identical(f1, f2));
}

main() {
  check(new Completer().future);
  check(new Future.sync(()=>1));
  check(new Future.sync((){ throw 1;}));
}
