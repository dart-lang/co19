/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a conditional property extraction expression e of
 * the form e1?.id is equivalent to the evaluation of the expression
 * ((x) => x == null?null : x.id)(e1), unless e1 is a type literal, in which
 * case it is equivalent to e1.m.
 * @description Check that e1?.id is equivalent to
 * ((x) => x == null?null : x.id)(e1).
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  String id = "id";
}

main() {
  C c1 = new C();
  C c2 = null;
  Expect.equals("id", c1?.id);
  Expect.isNull(c2?.id);
}
