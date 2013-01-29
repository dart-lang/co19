/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id. If no such declaration exists in the lexical scope, let d be the declaration
 * of the inherited member named id if it exists.
 * ...
 * • Otherwise, if e occurs inside a top level or static function (be it function,
 *   method, getter, or setter) or variable initializer, evaluation of e causes
 *   a NoSuchMethod to be thrown.
 * @description Checks that it is a runtime error when an undeclared identifier 
 * is used in a static context. 
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */

func() {
  return undeclared;
}

main() {
  try {
    func(); /// static type warning undeclared identifier in a top-level/static context
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ex) {}
}
