// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The value and detach arguments ... Both must be objects supported
/// as an [Expando] key.
///
/// @description Checks that [value] must be supported as an [Expando] key.
/// Test booleans.
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";

final Finalizer finalizer = Finalizer((_) { throw "Should not reach here"; });
Object detachToken = Object;

main() {
  Expect.throws(() {
    finalizer.attach(true, "Finalization token", detach: detachToken);
  });

  var b1 = false;
  Expect.throws(() {
    finalizer.attach(b1, "Finalization token");
  });

  bool? b2 = true;
  Expect.throws(() {
    finalizer.attach(b2, "Finalization token");
  });

  dynamic b3 = true;
  Expect.throws(() {
    finalizer.attach(b3, "Finalization token");
  });
}
