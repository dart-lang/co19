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
 * @description Test that const[] is valid parameter of constant constructor
 * if this parameter is not used in superexpression
 *
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

class A {
  final m;
  const A(this.m);
}

main() {
  const x = const A(const[]);
  Expect.equals(const[], x.m, "Wrong value set by the constant constructor");
}
