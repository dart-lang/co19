// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void attach(
///    Object value,
///    T finalizationToken,
///    {Object? detach}
/// )
/// Attaches this finalizer to [value].
///
/// When [value] is longer accessible to the program, while still having an
/// attachment to this finalizer, the [callback] of this finalizer may be
/// called with [finalizationToken] as argument.
///
/// @description Checks that finalizer can be attached to the different objects
/// and token is passed as a callback function parameter when object becomes
/// inaccessible.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

class A {}
Object? returnedToken;
int cnt = 0;

final Finalizer finalizer = Finalizer((token) {
  returnedToken = token;
  cnt++;
});

void clean() {
  returnedToken = null;
}

@pragma('vm:never-inline')
void attachToFinalizer1() {
  finalizer.attach(Object(), "Just a string");
  Expect.isNull(returnedToken);
}

@pragma('vm:never-inline')
void attachToFinalizer2() {
  finalizer.attach(A(), 15);
  Expect.isNull(returnedToken);
}

@pragma('vm:never-inline')
void attachToFinalizer3() {
  finalizer.attach(A(), []);
  Expect.isNull(returnedToken);
}

main() async {
  attachToFinalizer1();
  await triggerGcWithDelay();
  Expect.equals("Just a string", returnedToken);
  clean();

  attachToFinalizer2();
  await triggerGcWithDelay();
  Expect.equals(15, returnedToken);
  clean();

  attachToFinalizer3();
  await triggerGcWithDelay();
  Expect.equals([], returnedToken);
  clean();

  await triggerGcWithDelay();
  Expect.equals(3, cnt);
}
