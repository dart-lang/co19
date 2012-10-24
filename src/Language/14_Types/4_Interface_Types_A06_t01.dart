/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is ⊥ .
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that null (the only value of type ⊥) may be assigned to any variable.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview impossible to test other aspects? yes, I think so!
 */

class A {}

abstract class I {}

typedef t1();
typedef void t2();
typedef List t3(List<int> l, [Map<List, List<Map>> m]);

main() {
  var x = null;
  int i = null;
  Object o = null;
  String s = null;
  bool b = null;
  List l = null;
  List<int> l1 = null;
  List<List> l2 = null;
  List<Map<List, List>> l3 = null;
  double d = null;
  A a = null;
  I j = null;
  Function f = null;
  t1 v1 = null;
  t2 v2 = null;
  t3 v3 = null;
}

