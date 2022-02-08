// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a non-null detach value is provided, that object can be passed
/// to Finalizer.detach to remove the attachment again.
///
/// @description Checks that nothing happens if detach token is [null].
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

class A {}

int cnt = 0;
final Finalizer<Object> finalizer = Finalizer((token) {
  cnt++;
});

main() {
  A detachToken = A();
  {
    Object value = Object();
    finalizer.attach(value, "Finalization token", detach: null);
  }
  triggerGcWithDelay();
  Expect.equals(1, cnt);
}
