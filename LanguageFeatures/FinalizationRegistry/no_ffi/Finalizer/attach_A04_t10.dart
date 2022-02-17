// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The value and detach arguments ... Both must be objects supported
/// as an [Expando] key.
///
/// @description Checks that [value] must be supported as an [Expando] key.
/// Test booleans.
/// @author iarkh@unipro.ru

import '../../../../Utils/expect.dart';

final Finalizer finalizer = Finalizer((_) { throw "Should not reach here"; });

main() {
  final object = Object();
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: true);
  });

  var b1 = false;
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: b1);
  });

  bool? b2 = true;
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: b2);
  });

  dynamic b3 = true;
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: b3);
  });
}
