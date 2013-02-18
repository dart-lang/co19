/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is S.
 * T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that a generic type T with a single type parameter is a subtype of itself and
 * T is assignable to itself.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class A<T> {
}

main() {
  A a = new A();
  Expect.isTrue(a is A);
  A b = a;
  a = new A();
  Expect.isFalse(identical(a, b));

  A<int> n = new A<int>();
  Expect.isTrue(a is A<int>);
  Expect.isTrue(n is A);

  a = n;
  n = new A();

  List l1 = new List();
  Expect.isTrue(l1 is List);
  List l2 = l1;
  l1 = new List();

  List<int> li1 = new List<int>();
  Expect.isTrue(li1 is List<int>);
  List li2 = li1;
  li1 = new List<int>();

  List<List<List>> ll1 = new List<List<List>>();
  Expect.isTrue(ll1 is List<List<List>>);
  List ll2 = ll1;
  ll1 = new List<List<List>>();

  A<Map<List, List<Map<Object, Map>>>> z = new A<Map<List, List<Map<Object, Map>>>>();
  Expect.isTrue(z is A<Map<List, List<Map<Object, Map>>>>);
  A<Map<List, List<Map<Object, Map>>>> z2 = z;
  z = new A<Map<List, List<Map<Object, Map>>>>();
}
