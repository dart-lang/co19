// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finalizer<T> constructor (Null safety)
/// Finalizer<T>(void callback(T))
/// Creates a finalizer with the given finalization callback.
///
/// The callback is bound to the current zone when the [Finalizer] is created,
/// and will run in that zone when called.
///
/// @description Checks that finalizer object can be created and its callback
/// will run when attached object becomes inaccessible.
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

int called = 0;

final Finalizer finalizer = Finalizer((_) {
  called++;
});

main() {
  Object? obj = Object();
  finalizer.attach(obj, null);
  print(obj);
  obj = null;
  triggerGcWithDelay();
  Expect.equals(1, called);
}
