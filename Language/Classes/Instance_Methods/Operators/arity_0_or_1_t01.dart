/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile-time error if the arity of the user-declared
 * operator - is not 0 or 1.
 * The - operator is unique in that two overloaded versions are permitted.
 * If the operator has no arguments, it denotes unary minus.
 * If it as an argument, it denotes binary subtraction.
 * @description Checks that operator - can be defined both with 0 and 1 
 * arguments.
 * @author kaigorodov
 */
import "../../../../Utils/expect.dart";

class C {
  bool v;
  C(this.v);
  operator -() { return !v; }
  operator -(C v2) { return v||!v2.v; }
}

main() {
  Expect.isTrue(-new C(false));
  Expect.isTrue(new C(true) - new C(false));
  Expect.isFalse(new C(false) - new C(true));
}
