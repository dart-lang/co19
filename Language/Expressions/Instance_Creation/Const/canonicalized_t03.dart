/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of e proceeds as follows:
 * First, if e is of the form
 * const T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) then let i be the
 * value of the expression new T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * Otherwise, e must be of the form
 * const T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), in which case let i be
 * the result of evaluating new T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * Then:
 * • If during execution of the program, a constant object expression has
 *   already evaluated to an instance j of class R with type arguments Vi,
 *   1 <= i <= m, then:
 *   – For each instance variable f of i, let vif be the value of the field f
 *     in i, and let vjf be the value of the field f in j.
 *     If identical(vif, vjf ) for all fields f in i, then the value of e is j,
 *     otherwise the value of e is i.
 * • Otherwise the value of e is i.
 * In other words, constant objects are canonicalized.
 * @description Checks that constant object expressions yield identical
 * objects if all fields in constructed instances are identical.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class A {
  const A(): x = 1;
  final x;
}

class B {
  const B(arg): foo = arg;
  final foo;
}

main() {
  var o = const A();
  for (int i = 0; i < 10; i++) {
    Expect.identical(o, const A());
  }

  Expect.identical(const B(const Object()), const B(const Object()));
}
