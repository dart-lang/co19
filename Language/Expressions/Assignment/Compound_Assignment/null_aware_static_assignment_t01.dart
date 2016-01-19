/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form C.v ??= e,
 * where C is a type literal, is equivalent to the evaluation of the expression
 * ((x) => x == null? C.v = e : x)(C.v) where x is a fresh variable that is not
 * used in e.
 * @description Checks that in expression of the form C.v ??= e value is set only
 * if C.v == null
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  static var v = null;
}

main() {
  C.v = null;
  C.v ??= 1;
  Expect.equals(1, C.v);

  C.v ??= 2;
  Expect.equals(1, C.v);
}
