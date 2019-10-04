/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a map literal has a downwards inference type of [Map<K, V>] for
 * some [K] and [V], then the downwards inference context type of a spread
 * element in that map is [Map<K, V>].
 * @description Checks statically that a spread element inference context type
 * is [K, V] in the map literal
 * @author iarkh@unipro.ru
 */

class A1 {}
class B1 extends A1 {}
class C1 extends B1 {}

class A2 {}
class B2 extends A2 {}
class C2 extends B2 {}

Map<K, V> getAMap<K, V>(var a, var b) { return <K, V>{a: b}; }

main() {
  var int_map = getAMap<int, int>(1, 2);
  var str_map = getAMap<int, String>(1, "test");

  var a_map = getAMap<A1, A2>(new A1(), new A2());
  var b_map = getAMap<B1, B2>(new B1(), new B2());
  var c_map = getAMap<C1, C2>(new C1(), new C2());

  Map map1 = <int, int>{2: 4, 7: 16, ...int_map, 4: 40};
  Map map2 = <A1, A2>{new A1(): new A2(), ...?a_map};
  Map map3 = <A1, A2>{new A1(): new A2(), ...b_map};
  Map map4 = <A1, A2>{new A1(): new A2(), ...c_map, new B1(): new C2()};
  Map map5 = <A1, A2>{new A1(): new B2(), new B1(): new C2(),
      new C1(): new C2(), ...?c_map, new B1(): new A2(), ...a_map, ...b_map,
      new A1(): new C2()};
  Map map6 = <B1, B2>{new B1(): new B2(), ...?b_map, new C1(): new C2(),
      ...c_map};
  Map map7 = {123: 14, "123": "1", new A1(): null, new A2(): new C1(), ...a_map,
      ...?b_map, 148: new C1(), ...?c_map, ...int_map, 1499: null, -7: []};
}
