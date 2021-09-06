// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertionString variableName
/// read-only
/// @description Checks that this property returns name of the variable that
/// caused this error
/// @Issue 42470
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class C {
  static var x = throw CyclicInitializationError("x");
}

main() {
  try {
    C.x;
    Expect.fail("CyclicInitializationError error should be thrown");
  } on CyclicInitializationError catch (e) {
    if (isJS) {
      // Name is C_x on some web configurations.
      Expect.isTrue(e.variableName == "C_x" || e.variableName == "x");
    } else {
      Expect.equals("x", e.variableName);
    }
  }
}
