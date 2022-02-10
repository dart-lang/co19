// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When [value] is longer accessible to the program, while still
/// having an attachement to this finalizer, the [callback] of this finalizer
/// may be called with [finalizationToken] as argument.
///
/// @description Checks that callback function cannot be called while
/// finalization token is still accessible.
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

bool called = false;
final Finalizer finalizer = Finalizer((_) {
  called = true;
});

void test(Object o) async {
  await triggerGcWithDelay();
  Expect.isFalse(called);
}

Object test1(Object obj) => obj;

main() async {
  Object value = Object();
  finalizer.attach(value, "Finalization token");
  await triggerGcWithDelay();
  Expect.isFalse(called);
  await triggerGcWithDelay();
  Expect.isFalse(called);
  test(value);

  Object value1 = value;
  value = 12345;
  await triggerGcWithDelay();
  Expect.isFalse(called);

  var value2 = test1(value1);
  value1 = value;
  await triggerGcWithDelay();
  Expect.isFalse(called);
}
