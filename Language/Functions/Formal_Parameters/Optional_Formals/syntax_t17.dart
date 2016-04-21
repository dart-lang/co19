/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Optional parameters may be specified and provided with default
 * values.
 * defaultFormalParameter:
 *   normalFormalParameter ('=' expression)?
 * ;
 * defaultNamedParameter:
 *   normalFormalParameter (':' expression)?
 * ;
 * @description Checks that it is not a compile-time error if the name of a
 * positional optional initializing formal begins with an '_' character.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 * @reviewer rodionov
 * @note renamed from 2_Optional_Formals_A03_t02
 */

class A {
  var _p;
  A([this._p = ""]) {
    print(_p);
  }
}

main() {
  new A("It's alright");
}
