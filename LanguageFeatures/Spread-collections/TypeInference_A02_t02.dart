/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a spread element in a list or set literal has static type
 * [Iterable<T>] for some [T], then the upwards inference element type is [T].
 * @description Checks that spread element upwards inference element type is [T]
 * in the set literal
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  List<A> a_list        = <A>[new A()];
  List<B> b_list        = <B>[new B()];
  List<C> c_list        = <C>[new C()];
  List<int> int_list    = <int>[1, 2, 3];
  List<String> str_list = <String>["string"];

  A a = new A();
  B b = new B();
  C c = new C();

  Expect.isTrue({...int_list} is Set<int>);
  Expect.isTrue({"test", "a", ...?str_list, "ooooo"} is Set<String>);

  Expect.isTrue({...a_list} is Set<A>);
  Expect.isTrue({a, ...?a_list} is Set<A>);
  Expect.isTrue({...b_list} is Set<A>);
  Expect.isTrue({a, ...?b_list} is Set<A>);
  Expect.isTrue({...c_list} is Set<A>);
  Expect.isTrue({a, ...?c_list} is Set<A>);
  Expect.isTrue({a, ...a_list, ...b_list, b} is Set<A>);
  Expect.isTrue({a, b, c, ...a_list, ...b_list, ...?c_list} is Set<A>);
  Expect.isTrue({a, ...a_list, ...b_list, b} is Set<A>);

  Expect.isFalse({...a_list} is Set<B>);
  Expect.isFalse({b, ...?a_list} is Set<B>);
  Expect.isTrue({...b_list} is Set<B>);
  Expect.isTrue({b, ...?b_list} is Set<B>);
  Expect.isTrue({...c_list} is Set<B>);
  Expect.isTrue({b, ...?c_list} is Set<B>);
  Expect.isFalse({c, ...a_list, ...b_list, b} is Set<B>);
  Expect.isFalse({b, c, ...a_list, ...b_list, ...?c_list} is Set<B>);
  Expect.isTrue({b, ...c_list, ...b_list, b} is Set<B>);

  Expect.isFalse({...a_list} is Set<C>);
  Expect.isFalse({c, ...?a_list} is Set<C>);
  Expect.isFalse({...b_list} is Set<C>);
  Expect.isFalse({c, ...?b_list} is Set<C>);
  Expect.isTrue({...c_list} is Set<C>);
  Expect.isTrue({...?c_list} is Set<C>);
  Expect.isTrue({c, ...?c_list} is Set<C>);
  Expect.isFalse({c, ...a_list, ...b_list, c} is Set<C>);
  Expect.isFalse({c, ...a_list, ...b_list, ...?c_list} is Set<C>);
  Expect.isFalse({a, ...c_list, ...b_list, b} is Set<C>);
}
