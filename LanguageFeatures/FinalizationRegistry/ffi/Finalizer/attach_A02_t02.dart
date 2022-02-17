// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When [value] is longer accessible to the program, while still
/// having an attachement to this finalizer, the [callback] of this finalizer
/// may be called with [finalizationToken] as argument.
///
/// @description Checks that callback function can be called only once when
/// given object is inaccessible.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

int called = 0;
final Finalizer finalizer = Finalizer((_) {
  called++;
});

@pragma('vm:never-inline')
void attachToFinalizer() {
  var o = Object();
  finalizer.attach(o, "Finalization token");
}

main() async {
  await triggerGcWithDelay();
  await triggerGcWithDelay();
  triggerGc();
  await triggerGcWithDelay();
  triggerGc();
  triggerGc();
  await triggerGcWithDelay();

  Expect.equals(1, called);
}
