// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The [value] and [detach] arguments ... may be the same object.
///
/// @description Checks that [value] and [detach] arguments can be the same
/// object.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

int called = 0;
final Finalizer finalizer = Finalizer((_) {
  called++;
});

main() async {
  Object value = Object();
  finalizer.attach(value, "Finalization token", detach: value);
  print(value);
  finalizer.detach(value);
  value = 12345;
  await triggerGcWithDelay();
  Expect.equals(0, called);
}
