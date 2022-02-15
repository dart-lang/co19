// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The [value] and [detach] arguments ... may be the same object.
///
/// @description Checks that [value] and [detach] arguments can be the same
/// object. If [value] is not a live object anymore and it was not detached,
/// finalyzer can run.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

int called = 0;
final Finalizer finalizer = Finalizer((_) {
  called++;
});


@pragma('vm:never-inline')
void test() {
  Object obj = Object();
  finalizer.attach(obj, "Just a string", detach: obj);
  print(obj);
}

main() async {
  test();
  await triggerGcWithDelay();
  Expect.equals(1, called);
  await triggerGcWithDelay();
  Expect.equals(1, called);
  await triggerGcWithDelay();
  Expect.equals(1, called);
}
