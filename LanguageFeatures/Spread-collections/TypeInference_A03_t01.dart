/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a map literal has a downwards inference type of [Map<K, V>] for
 * some [K] and [V], then the downwards inference context type of a spread
 * element in that map is [Map<K, V>].
 * @description Checks that a spread element inference context type is [K, V] in
 * the map literal
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
  dynamic int_map = getAMap<int, int>(1, 2);
  dynamic str_map = getAMap<int, String>(1, "test");

  dynamic a_map = getAMap<A1, A2>(new A1(), new A2());
  dynamic b_map = getAMap<B1, B2>(new B1(), new B2());
  dynamic c_map = getAMap<C1, C2>(new C1(), new C2());

  Map map1 = <int, int>{2: 4, 7: 16, ...int_map, 4: 40};
  Expect.isTrue(map1 is Map<int, int>);

  Map map2 = <A1, A2>{new A1(): new A2(), ...?a_map};
  Expect.isTrue(map2 is Map<A1, A2>);

  Map map3 = <A1, A2>{new A1(): new A2(), ...b_map};
  Expect.isTrue(map3 is Map<A1, A2>);

  Map map4 = <A1, A2>{new A1(): new A2(), ...c_map, new B1(): new C2()};
  Expect.isTrue(map4 is Map<A1, A2>);

  Map map5 = <A1, A2>{new A1(): new B2(), new B1(): new C2(),
      new C1(): new C2(), ...?c_map, new B1(): new A2(), ...a_map, ...b_map,
      new A1(): new C2()};
  Expect.isTrue(map5 is Map<A1, A2>);

  Map map6 = <B1, B2>{new B1(): new B2(), ...?b_map, new C1(): new C2(),
      ...c_map};
  Expect.isTrue(map6 is Map<B1, B2>);

  Map map7 = {123: 14, "123": "1", new A1(): null, new A2(): new C1(), ...a_map,
      ...?b_map, 148: new C1(), ...?c_map, ...int_map, 1499: null, -7: []};
  Expect.isTrue(map7 is Map<Object, Object>);

  Map map8;
  Expect.throws(() => map8 = <int, int>{...str_map});
  Expect.throws(() => map8 = <int, String>{
      1: "1", 2: "2", ...int_map, 14: "14"});
  Expect.throws(() => map8 = <int, C2>{1 : new C2(), ...c_map});

  Expect.throws(() => map8 = <int, A2>{...int_map});
  Expect.throws(() => map8 = <A1, String>{...?str_map});

  Expect.throws(() => map8 = <B1, B2>{...a_map});
  Expect.throws(() => map8 = <B1, B2>{
      new B1(): new C2(), ...?a_map, new C1(): new C2()});

  Expect.throws(() => map8 = <C1, C2>{...b_map});
  Expect.throws(() => map8 = <C1, C2>{...a_map, ...?b_map});

  Expect.throws(() => map8 = <B1, B2>{...a_map});
  Expect.throws(() =>
      map8 = <B1, B2>{new B1(): new C2(), ...?a_map, new C1(): new C2()});

  Expect.throws(() => map8 = <C1, C2>{...b_map});
  Expect.throws(() => map8 = <C1, C2>{...a_map, ...?b_map});
}
