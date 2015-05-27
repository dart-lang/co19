/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form id(a1, ... , an, xn+1 : an+1, ... , xn+k :
 * an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the inner-
 * most such declaration. Then:
 *  - If fid is a local function, a library function, a library or static getter or a
 * variable then i is interpreted as a function expression invocation.
 *  - Otherwise, if fid is a static method of the enclosing class C, i is equivalent to
 * C.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 *  - Otherwise, fid is necessarily an instance method or getter of the enclosing
 * class C, and i is equivalent to the ordinary method invocation
 * this.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * Otherwise, if i occurs inside a top level or static function (be it function,
 * method, getter, or setter) or variable initializer, evaluation of i causes a
 * NoSuchMethodError to be thrown.
 * If i does not occur inside a top level or static function, i is equivalent to
 * this.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * @description Checks that if there is no declaration and i occurs in top level
 * function (of any kind) or library variable initializer, evaluation of i
 * causes a NoSuchMethodError to be thrown.
 * @static-warning
 * @author ilya
 */
import "../../../Utils/expect.dart";

test() =>  undeclared();
get test2 => undeclared2();
set test3 (_) => undeclared3();
var test4 = undeclared4();

main() {
  Expect.throws(() => test(), (e) => e is NoSuchMethodError);
  Expect.throws(() => test2, (e) => e is NoSuchMethodError);
  Expect.throws(() => test3 = 1, (e) => e is NoSuchMethodError);
  Expect.throws(() => test4, (e) => e is NoSuchMethodError);
}

