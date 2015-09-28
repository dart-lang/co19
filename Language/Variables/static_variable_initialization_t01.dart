/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static variable declarations are initialized lazily. When a 
 * static variable v is read, iff it has not yet been assigned, it is set to 
 * the result of evaluating its initializer.
 * @description Checks that static variable declarations are initialized lazily 
 * by assigning a throw expression to a top-level variable and checking that 
 * it is only evaluated when that variable is accessed.
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

var foo = throw new IntegerDivisionByZeroException();

main() {
  Expect.throws(() => foo, (e) => e is IntegerDivisionByZeroException);
}
