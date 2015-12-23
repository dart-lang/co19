/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form
 * id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the
 * innermost such declaration. Then:
 * . . .
 *  • If fid is a local function, a library function, a library or static getter
 *    or a variable then i is interpreted as a function expression invocation.
 * . . .
 *  • Otherwise, fid is necessarily an instance method or getter of the
 *    enclosing class C, and i is equivalent to the ordinary method invocation
 *    this.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * . . .
 * @description Checks that an unqualified invocation is resolved correctly and
 * the innermost matching declaration is used.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

m() {
  return "library function";
}

class A {
  m() {
    return "instance method";
  }

  test() {
    var m = () => "local function";
    Expect.equals("local function", m());
  }
}

class B {
  m() {
    return "instance method too";
  }

  test() {
    Expect.equals("instance method too", m());
  }
}

class D {
  test() {
    Expect.equals("library function", m());
  }
}

main() {
  new A().test();
  new B().test();
  new D().test();
}
