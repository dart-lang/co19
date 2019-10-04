/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a spread element in a map literal has static type [Map<K, V>]
 * for some [K] and [V], then the upwards inference key type is [K] and the
 * value type is [V].
 * @description Checks that spread element upwards inference key type is [K] and
 * the value type is [V] in the map literal
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

class A1 {}
class B1 extends A1 {}
class C1 extends B1 {}

class A2 {}
class B2 extends A2 {}
class C2 extends B2 {}

Map<K, V> getAMap<K, V>(var a, var b) { return <K, V>{a: b}; }

main() {
  var int_map = getAMap<int, int>(1, 2);
  var str_map = getAMap<int, String>(100, "test");

  var a_map = getAMap<A1, A2>(new A1(), new A2());
  var b_map = getAMap<B1, B2>(new B1(), new B2());
  var c_map = getAMap<C1, C2>(new C1(), new C2());

  A1 a1 = new A1();
  B1 b1 = new B1();
  C1 c1 = new C1();
  A2 a2 = new A2();
  B2 b2 = new B2();
  C2 c2 = new C2();

  Expect.isTrue({...int_map} is Map<int, int>);
  Expect.isTrue({1: "test", 2: "a", ...?str_map, 3: "oo"} is Map<int, String>);

  Expect.isTrue({...a_map} is Map<A1, A2>);
  Expect.isTrue({a1: a2, ...?a_map} is Map<A1, A2>);
  Expect.isTrue({...b_map} is Map<A1, A2>);
  Expect.isTrue({a1: a2, ...?b_map} is Map<A1, A2>);
  Expect.isTrue({...c_map} is Map<A1, A2>);
  Expect.isTrue({a1: a2, ...?c_map} is Map<A1, A2>);
  Expect.isTrue({a1: a2, ...a_map, ...b_map, b1: b2} is Map<A1, A2>);
  Expect.isTrue(
      {a1: a2, b1: b2, c1: c2, ...a_map, ...?b_map, ...c_map} is Map<A1, A2>);
  Expect.isTrue({a1: a2, ...a_map, ...b_map, b1: b2} is Map<A1, A2>);

  Expect.isFalse({...a_map} is Map<B1, B2>);
  Expect.isFalse({b1: b2, ...?a_map} is Map<B1, B2>);
  Expect.isTrue({...b_map} is Map<B1, B2>);
  Expect.isTrue({b1: b2, ...?b_map} is Map<B1, B2>);
  Expect.isTrue({...c_map} is Map<B1, B2>);
  Expect.isTrue({b1: b2, ...?c_map} is Map<B1, B2>);
  Expect.isFalse({c1: c2, ...a_map, ...b_map, b1: b2} is Map<B1, B2>);
  Expect.isFalse(
      {b1: b2, c1: c2, ...a_map, ...b_map, ...?c_map} is Map<B1, B2>);
  Expect.isFalse({a1: a2, ...c_map, ...b_map, b1: b2} is Map<B1, B2>);
}
