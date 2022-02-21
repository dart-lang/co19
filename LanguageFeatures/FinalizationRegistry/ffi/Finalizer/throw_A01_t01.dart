// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finalization callbacks must not throw.
///
/// @description Checks that all exceptions thrown by finalization callbacks are
/// ignored
/// @author sgrekhov@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

int count = 0;
String? returnedToken = null;

final Finalizer finalizer = Finalizer((token) {
  count++;
  if (token == "throw") {
    throw Exception("Some exception");
  }
  returnedToken = token;
});

@pragma('vm:never-inline')
void attachToFinalizer() {
  var o = Object();
  finalizer.attach(o, "throw");
  finalizer.attach(o, "Don't throw");
}

main() async {
  attachToFinalizer();
  await triggerGcWithDelay();
  Expect.equals("Don't throw", returnedToken);
  Expect.equals(2, count);
}
