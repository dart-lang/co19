/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a list or set literal has a downwards inference type of
 * [Iterable<T>] for some [T], then the downwards inference context type of a
 * spread element in that list is [Iterable<T>].
 * @description Checks that a spread element inference context type is [T] in
 * the list literal
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

List<T> getAList<T>(var a) { return <T>[a]; }

main() {
  dynamic a_list   = getAList<A>(new A());
  dynamic b_list   = getAList<B>(new B());
  dynamic c_list   = getAList<C>(new C());
  dynamic int_list = getAList<int>(12);
  dynamic str_list = ["string"];
  A a = new A();
  B b = new B();
  C c = new C();

  List list1 = <int>[2, 7, ...int_list, 4];
  Expect.isTrue(list1 is List<int>);

  List list2 = <A>[a, ...a_list];
  Expect.isTrue(list2 is List<A>);

  List list3 = <A>[a, ...b_list];
  Expect.isTrue(list3 is List<A>);

  List list4 = <A>[a, c, ...c_list, b];
  Expect.isTrue(list4 is List<A>);

  List list5 = <A>[a, b, c, ...c_list, new B(), ...a_list, ...b_list, new A()];
  Expect.isTrue(list5 is List<A>);

  List list6 = <B>[b, ...b_list, c, ...c_list];
  Expect.isTrue(list6 is List<B>);

  List list7 = [123, "123", null, a, ...a_list, ...?b_list, c, b, ...?c_list,
      ...str_list, ...int_list, null, 1499, []];
  Expect.isTrue(list7 is List<Object>);

  List list8;

  Expect.throws(() => list8 = <int>[...str_list]);
  Expect.throws(() => list8 = <int>[1, 2, ...a_list, 14]);
  Expect.throws(() => list8 = <int>[1, 14, 0, ...c_list]);

  Expect.throws(() => list8 = <A>[...int_list]);
  Expect.throws(() => list8 = <A>[...?str_list]);

  Expect.throws(() => list8 = <B>[...a_list]);
  Expect.throws(() => list8 = <B>[b, ...?a_list, c]);

  Expect.throws(() => list8 = <C>[...b_list]);
  Expect.throws(() => list8 = <C>[...a_list, ...?b_list]);

  Expect.throws(() => list8 = <B>[...a_list]);
  Expect.throws(() => list8 = <B>[b, ...?a_list, c]);

  Expect.throws(() => list8 = <C>[...b_list]);
  Expect.throws(() => list8 = <C>[...a_list, ...?b_list]);
}
