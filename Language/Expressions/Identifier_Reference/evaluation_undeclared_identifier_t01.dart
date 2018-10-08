/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * ...
 * • Otherwise, if e occurs inside a top level or static function (be it
 *   function, method, getter, or setter) or variable initializer, evaluation
 *   of e causes a NoSuchMethod to be thrown.
 * @description Checks that NoSuchMethodError is thrown if undeclared
 * identifier is used in a static context.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

dynamic o = '';

x1() => o.undeclared;       // in a body of library function
get x2 => o.undeclared;     // in a body of library getter
set x3 (_) => o.undeclared; // in a body of library setter
var x4 = o.undeclared;      // in an initializer of a library variable

class C {
  static x1() => o.undeclared;       // in a body of class static function
  static get x2 => o.undeclared;     // in a body of class static getter
  static set x3 (_) => o.undeclared; // in a body of class static setter
  static var x4 = o.undeclared;      // in an initializer of a class static variable
}

main() {
  Expect.throws(() => x1(), (e) => e is NoSuchMethodError);
  Expect.throws(() => x2, (e) => e is NoSuchMethodError);
  Expect.throws(() => x3 = 1, (e) => e is NoSuchMethodError);
  Expect.throws(() => x4, (e) => e is NoSuchMethodError);

  Expect.throws(() => C.x1(), (e) => e is NoSuchMethodError);
  Expect.throws(() => C.x2, (e) => e is NoSuchMethodError);
  Expect.throws(() => C.x3 = 1, (e) => e is NoSuchMethodError);
  Expect.throws(() => C.x4, (e) => e is NoSuchMethodError);
}
