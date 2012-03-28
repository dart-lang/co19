/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a parameterized type S < U1, ... ,Um >, let R = S. It is a
 * compile-time error if S is not a generic type with m type parameters. If T is
 * not a parameterized type, let R = T. If R is an interface, let C be the factory
 * class of R. Otherwise let C = R. Furthermore, if e is of the form new
 * T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) then let q be the constructor of C
 * that corresponds to the constructor T.id, otherwise let q be the constructor
 * of C that corresponds to the constructor T. Finally, if C is generic but T is
 * not a parameterized type, then for i from 1 to m, let Vi = Dynamic, otherwise let
 * Vi = Ui.
 * Evaluation of e proceeds as follows:
 * First, if q is a generative constructor, then:
 * If R != C then let Wi be the type parameters of R (if any) and let Di be the
 * bound of Wi, i from 1 to m. In checked mode, it is a dynamic type error if Vi is
 * not a subtype of [V1, ... , Vm/W1, ... , Wm]Di, i from 1 to m.
 * @description  Checks that it is a dynamic type error if a type argument is not
 * a subtype of its bound in interface R.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 * @needsreview http://code.google.com/p/dart/issues/detail?id=1380
 */

#import("../../../Utils/dynamic_check.dart");

interface R<T extends num> default A<T> {
  R();
}

class A<T> implements R<T>{
  A() {}
}

main() {
  checkTypeError( () {
    new R<bool>();
  });
}
