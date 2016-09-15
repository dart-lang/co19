/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form
 * id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the
 * innermost such declaration. Then:
 * . . .
 * Otherwise, if i occurs inside a top level or static function (be it function,
 * method, getter, or setter) or variable initializer, evaluation of i causes a
 * NoSuchMethodError to be thrown.
 * . . .
 * @description Checks that if there is no declaration and i occurs in top level
 * function (of any kind) or library variable initializer, evaluation of i
 * causes a NoSuchMethodError to be thrown.
 * @compile-error
 * @author ilya
 */
set test (_) => undeclared();

main() {
  test3 = 1;
}

