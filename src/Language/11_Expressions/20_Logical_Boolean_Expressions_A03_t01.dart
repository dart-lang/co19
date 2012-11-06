/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a logical boolean expression b of the form e1&&e2 causes the
 * evaluation of e1; if e1 does not evaluate to true, the result of evaluating b
 * is false, otherwise e2 is evaluated to an object o, which is then subjected to
 * boolean conversion producing an object r, which is the value of b.
 * @description Checks that an expression of the form e1 && e2 is evaluated correctly
 * (meaning it produces TypeError when e1 does not evaluate to a boolean and performs
 * boolean conversion for e2 otherwise, provided e1 is true).
 * @author msyabro
 * @static-warning
 * @reviewer rodionov
 */

import "../../Utils/dynamic_check.dart";

main() {
  Expect.isTrue(true && true);
  Expect.isFalse(true && false);
  Expect.isFalse(false && true);
  Expect.isFalse(false && false);

  checkTypeError(() => Expect.isFalse(true && 1));
  checkTypeError(() => Expect.isFalse(true && ""));
  checkTypeError(() => Expect.isFalse(true && []));
  checkTypeError(() => Expect.isFalse(true && {}));
  checkTypeError(() => Expect.isFalse(true && () => null));

  checkTypeError(() => Expect.isFalse(0 && 1));
  checkTypeError(() => Expect.isFalse("" && 2));
  checkTypeError(() => Expect.isFalse(null && []));
}
