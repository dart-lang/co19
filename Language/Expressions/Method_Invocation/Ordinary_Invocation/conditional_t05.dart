/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a conditional ordinary method invocation e of the
 * form o?.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k)
 * is equivalent to the evaluation of the expression
 * ((x) => x == null?null : x.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k))(o).
 * unless o is a type literal, in which case it is equivalent to
 * o.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
 * @description Check that e1?.id is equivalent to
 * ((x) => x == null?null : x.id)(e1). Test conditional invocation of the
 * method with parameters (including named parameters)
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  String m1(String p) => "A" + p;
}

class C extends A {
  String m2(String p, {String p2}) => "C" + p;
}

main() {
  C c1 = new C();
  C c2 = null;
  Expect.equals("A1", c1?.m1("1"));
  Expect.equals("C2", c1?.m2("2", p2: "3"));

  Expect.isNull(c2?.m1("1"));
  Expect.isNull(c2?.m2("2", p2: "3"));
}
