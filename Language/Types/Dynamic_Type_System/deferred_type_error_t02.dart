// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a runtime error if deferred type is used in a
/// variable initialization
/// @description Checks that it is a runtime error if deferred type is used in a
/// variable initialization
/// @author ngl@unipro.ru

import "../../../Utils/expect.dart";
import "../somelib1.dart" deferred as p;

main() {
  try {
    var a = new p.C();
    Expect.fail("Exception expected");
  } catch (_) {
  }
}
