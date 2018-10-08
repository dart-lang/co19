/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Error thrown when a lazily initialized variable cannot be
 * initialized.
 * A static/library variable with an initializer expression is initialized the
 * first time it is read. If evaluating the initializer expression causes
 * another read of the variable, this error is thrown.
 * @description Checks that if evaluating the initializer expression causes
 * another read of the variable, then CyclicInitializationError is thrown.
 * Test library variable
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "CyclicInitializationError.lib.dart" as lib;

main() {
  try {
    lib.x;
    Expect.fail("CyclicInitializationError error should be thrown");
  } on CyclicInitializationError catch (e) {
    Expect.equals("x", e.variableName);
  }
}
