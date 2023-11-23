// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a non-null detach value is provided, that object can be passed
/// to Finalizer.detach to remove the attachment again.
///
/// @description Checks that if detach token was passed to [attach], given
/// object can be detached from the finalizer using [detach].
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

class A {}

int called = 0;
final Finalizer finalizer = Finalizer((_) {
  called++;
});

@pragma('vm:never-inline')
void attachAndDetach() {
  A detachToken = A();
  Object value = Object();
  finalizer.attach(value, "Finalization token", detach: detachToken);
  finalizer.detach(detachToken);
}

main() async {
  attachAndDetach();

  await triggerGcWithDelay();
  triggerGc();
  await triggerGcWithDelay();
  triggerGcWithDelay();
  triggerGcWithDelay();
  await Future.delayed(Duration(milliseconds: 10));

  Expect.equals(0, called);
}
