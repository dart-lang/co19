/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void complete([T value])
 * Completes future with the supplied values. All listeners on the future will be
 * immediately informed about the value.
 * @description Checks that all listeners on the future are informed immediately.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

int N=10;
const v=99;
List listened=new List(N);

main() {
  var completer = new Completer();
  var future = completer.future;

  for (int k=0; k<N; k++) {
    future.then((fValue) {
      listened[k]=fValue;
    });
  }

  completer.complete(v);
  for (int k=0; k<N; k++) {
    Expect.equals(v, listened[k]);
  }
  
}
