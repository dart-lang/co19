/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form e1?.v++ is
 * equivalent to executing ((x) => x == null? null: x.v++)(e1) unless e1 is
 * a type literal, in which case it is equivalent to e1.v++
 * @description Checks that if in expression e1?.v++ e1 is a type literal,
 * then it is equivalent to e1.v++
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  static int v = 0;
}

main() {
  Expect.equals(C?.v++, 0);
  Expect.equals(C?.v, 1);
}
