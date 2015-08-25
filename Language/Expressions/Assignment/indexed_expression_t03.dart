/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1[e2] = e3 is equivalent to the
 * evaluation of the expression (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * The static type of the expression e1 [e2 ] = e3 is the static type of e3.
 * @description Checks that method noSuchMethod is invoked (which results in NoSuchMethodError)
 * if the type of e1 doesn't define a []= operator.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class C {
  operator[](idx) {}
}

main() {
  C c = new C();
  try {
    c[0] = 1; /// static type warning - invoking an unknown instance member, see "Ordinary invocation"
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}

  try {
    c["o"] = 1; /// static type warning - invoking an unknown instance member, see "Ordinary invocation"
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}

  try {
    c[false] = 1; /// static type warning - invoking an unknown instance member, see "Ordinary invocation"
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}

  try {
    c[1.01] = 1; /// static type warning - invoking an unknown instance member, see "Ordinary invocation"
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
}
