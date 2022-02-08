// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a non-null detach value is provided, that object can be passed
/// to Finalizer.detach to remove the attachment again.
///
/// @description Checks that if detach token was passed to [attach], given
/// object can be detached from the finalizer using [detach].
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

class A {}

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
  Object detachToken = A();
  finalizer.attach(value, "Finalization token", detach: detachToken);
  print(value);
  finalizer.detach(detachToken);

  value = 12345;

  // Initial object is not accessible anymore.
  // Do something, call triggerGC several times and check that callback was
  // not called during the execution.
  test(value);
  triggerGcWithDelay();

  var value1 = test1(value);
  triggerGcWithDelay();
  triggerGcWithDelay();
  triggerGcWithDelay();

  Expect.equals(0, called);
}
