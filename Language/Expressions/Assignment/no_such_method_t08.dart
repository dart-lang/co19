/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as
 * follows:
 * Let d be the innermost declaration whose name is v or v =, if it exists.
 * If d is the declaration of a local variable, ...
 * If d is the declaration of a library variable, top level getter or top level
 * setter, ...
 * Otherwise, if d is the declaration of a static variable, static getter or
 * static setter in class C, ...
 * Otherwise, If a occurs inside a top level or static function (be it function,
 * method, getter, or setter) or variable initializer, evaluation of a causes e
 * to be evaluated, after which a NoSuchMethodError is thrown.
 * @description Checks that if an assignment a is inside a variable initializer
 * then evaluation of a causes e to be evaluated, after which
 * a NoSuchMethodError is thrown.
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

bool evaluated = false;

int e() {
  evaluated = true;
  return 0;
}

main() {
  dynamic x = new Object();
  Expect.throws(() {int i = (x.v = e());}, (e) => e is NoSuchMethodError);
  Expect.isTrue(evaluated);
}
