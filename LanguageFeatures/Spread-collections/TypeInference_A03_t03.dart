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

  Map map1 = <int, int>{...str_map};                              //# 01: compile-time error
  Map map2 = <int, String>{1: "1", 2: "2", ...int_map, 14: "14"}; //# 02: compile-time error
  Map map3 = <int, C2>{1 : new C2(), ...c_map};                   //# 03: compile-time error
  Map map4 = <int, A2>{...int_map};                               //# 04: compile-time error
  Map map5 = <A1, String>{...?str_map};                           //# 05: compile-time error
}
