// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The value and detach arguments ... Both must be objects supported
/// as an [Expando] key.
///
/// @description Checks that [value] must be supported as an [Expando] keys.
/// Test [Null].
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

final Finalizer finalizer = Finalizer((_) { throw "Should not reach here"; });

main() {
  dynamic d = null;
  Expect.throws(() {
    finalizer.attach(d, "Finalization token");
  });
}
