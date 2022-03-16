// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The value and detach arguments ... Both must be objects supported
/// as an [Expando] key.
///
/// @description Checks that [value] must be supported as an [Expando] key.
/// Test [Null]: it should not throw on a [null] detach argument, just treat it
/// as having no detach object. Passing null is the same as not passing any
/// argument. See Issue 48390 evaluation for more details.
/// @author iarkh@unipro.ru
/// @issue 48390

import '../../../../Utils/expect.dart';
import '../../gc_utils_lib.dart';

final finalizerTokens = <Object>{};
int cnt = 0;

final Finalizer finalizer = Finalizer((token) {
  finalizerTokens.add(token);
  cnt++;
});

@pragma('vm:never-inline')
void attachToFinalizer1() {
  Object object1 = Object();
  Object object2 = Object();
  finalizer.attach(object1, "Object1", detach: null);
  dynamic d = null;
  finalizer.attach(object2, "Object2", detach: d);
}

main() async {
  attachToFinalizer1();
  for (int i = 0; i < 10; i++) {
    await triggerGcWithDelay();
    Expect.setEquals({"Object1", "Object2"}, finalizerTokens);
    Expect.equals(2, cnt);
  }
}
