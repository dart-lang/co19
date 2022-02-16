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
/// @description Checks that generic finalizer can be attached to the different
/// objects and token is passed as a callback function parameter when object
/// becomes inaccessible.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

class A {}
Object? returnedToken;
int cnt = 0;

final Finalizer<int> finalizer = Finalizer((token) {
  returnedToken = token;
  cnt++;
});

@pragma('vm:never-inline')
void attachToFinalizer(Object value, int finalizationToken) {
  finalizer.attach(value, finalizationToken);
}

main() async {
  attachToFinalizer(Object(), 1);
  await triggerGcWithDelay();
  Expect.equals(1, returnedToken);

  attachToFinalizer(A(), 15);
  await triggerGcWithDelay();
  Expect.equals(15, returnedToken);

  await triggerGcWithDelay();
  Expect.equals(15, returnedToken);

  attachToFinalizer(A(), 14);
  await triggerGcWithDelay();
  Expect.equals(14, returnedToken);
  Expect.equals(3, cnt);

  await triggerGcWithDelay();
  await triggerGcWithDelay();
  await triggerGcWithDelay();
  Expect.equals(3, cnt);
}
