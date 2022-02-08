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
/// attachement to this finalizer, the [callback] of this finalizer may be
/// called with [finalizationToken] as argument.
///
/// @description Checks that callback function cannot be called only once when
/// finalization token is unaccessible.
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

class A{}

int called = 0;
final Finalizer finalizer = Finalizer((_) {
  called++;
});

void test(Object o) {
  triggerGcWithDelay();
}

Object test1(Object obj) => obj;

main() {
  Object value = Object();
  finalizer.attach(value, "Finalization token");

  value = 12345;

  // Initial object is not accessible anymore.
  // Do something, call triggerGC sevewral times and check that callback is
  // called only once during the execution.
  test(value);
  triggerGcWithDelay();

  var value1 = test1(value);
  triggerGcWithDelay();
  triggerGcWithDelay();
  triggerGcWithDelay();

  Expect.equals(1, called);
}
