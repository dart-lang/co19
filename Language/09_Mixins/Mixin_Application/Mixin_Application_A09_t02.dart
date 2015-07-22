/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a class definition of the form class C = M ; or the form class
 * C < T 1 , . . . , T n > = M ; in library L is to introduce the name C into the scope
 * of L, bound to the class (10) defined by the mixin application M . The name
 * of the class is also set to C. Iff the class is prefixed by the built-in identifier
 * abstract, the class being defined is an abstract class.
 * @description Checks that class C is not abctract if there are no abstract identifier
 * but M in S with M is abstract
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

abstract class M {
  int m();
}

class S {
  get g => 0;
}

class C = S with M;

main() {
  C c = new C();
  Expect.equals(0, c.g);
}
