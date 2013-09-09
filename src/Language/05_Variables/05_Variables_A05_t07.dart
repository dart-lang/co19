/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose binding is fixed upon
 * initialization; a final variable v will always refer to the same object
 * after v has been initialized. The declaration of a final variable must
 * include the modifier final.
 * It is a static warning if a final instance variable that has been
 * initialized at its point of declaration  is  also initialized in a
 * constructor.
 * It is a static warning if a library, static or local variable v is final
 * and v is not initialized at its point of declaration.
 * Attempting to assign to a final variable anywhere except in its declaration
 * or in a constructor header  will cause a runtime error to be thrown as
 * discussed below. The assignment will also give rise to a static warning.
 * Any repeated assignment to a final variable will also lead to a runtime
 * error
 * @description Checks that it is a static warning and runtime error to assign
 * to final instance variable anywhere except in its declaration or a
 * constructor header
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

class C {
  final v = 1;
  final bool v2 = true;
}

main() {
  Expect.throws(() => new C().v = 1);      /// static warning
  Expect.throws(() => new C().v = 2);      /// static warning
  Expect.throws(() => new C().v2 = true);  /// static warning
  Expect.throws(() => new C().v2 = false); /// static warning
}
