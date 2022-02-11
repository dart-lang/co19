// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The value and detach arguments ... Both must be objects supported
/// as an [Expando] key.
///
/// @description Checks that detach token must be supported as an [Expando] key.
/// Test numbers.
/// @author iarkh@unipro.ru

import '../../../../Utils/expect.dart';

final Finalizer finalizer = Finalizer((_) { throw "Should not reach here"; });
Object object = Object();

main() {
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: 12345);
  });

  var i = 3.14;
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: i);
  });

  int j = -12934;
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: j);
  });

  dynamic d = -12.376;
  Expect.throws(() {
    finalizer.attach(object, "Finalization token", detach: d);
  });
}
