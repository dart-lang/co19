/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expressions in the field-initializers of a const constructor must be constant expressions. 
 * They may use the constructor's arguments, but, when the arguments are constant expressions, 
 * then the initializer-expressions must be constant expressions, too.
 * @description Checks initialization with non-const value.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

class F {
  F() {}
  static F makeF() {return new F();}
}

class C {
  const C() : v = F.makeF();
  final v;
}

void main() {
  final c = new C();
}
