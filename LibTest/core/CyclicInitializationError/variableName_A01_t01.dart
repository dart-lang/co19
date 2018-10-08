/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionString variableName
 * read-only
 * @description Checks that this property returns name of the variable that
 * caused this error
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  static var x = f();
  static f() => x + 1;
}

main() {
  try {
    C.x;
    Expect.fail("CyclicInitializationError error should be thrown");
  } on CyclicInitializationError catch (e) {
    Expect.equals("x", e.variableName);
  }
}
