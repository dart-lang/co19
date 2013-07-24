/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is Dynamic.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that a dynamic variable can be assigned a value of any type
 * without static warnings or type errors. 
 * @author iefremov
 * @reviewer rodionov
 */

class C {
  C() {}
}

main() {
  var x1 = null;
  var x2 = new Object();
  var x3 = true;
  var x4 = false;
  var x5 = (){};
  var x6 = new List();
  var x7 = new Map<int, int>();
  var x8 = 1;
  var x9 = 1.0;
  var x10 = "1";
  var x11 = new C();
}
