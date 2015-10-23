/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Note that a parameter that is not used in a superexpression that
 * is restricted to certain types can be a constant of any type. For example
 * class A {
 *   final m;
 *   const A(this.m);
 * }
 * can be instantiated via const A(const[]);
 *
 * @description Test that different types of constants are valid parameters
 * of constant constructor if this parameter is not used in superexpression
 *
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

class A {
  final m;
  const A(this.m);
}

main() {
  const a1 = const A(1);
  const a2 = const A("");
  const a3 = const A(null);
  const a4 = const A(false);

  const x1 = const A(a1);
  const x2 = const A(a2);
  const x3 = const A(a3);
  const x4 = const A(a4);

  Expect.equals(1, x1.m.m);
  Expect.equals("", x2.m.m);
  Expect.equals(null, x3.m.m);
  Expect.equals(false, x4.m.m);
}
