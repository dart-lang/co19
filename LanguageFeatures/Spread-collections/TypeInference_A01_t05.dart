/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a list or set literal has a downwards inference type of
 * [Iterable<T>] for some [T], then the downwards inference context type of a
 * spread element in that list is [Iterable<T>].
 * @description Checks statically that a spread element inference context type
 * is [T] in the set literal
 * @author iarkh@unipro.ru
 */

class A {}
class B extends A {}
class C extends B {}

List<T> getAList<T>(var a) { return <T>[a]; }

main() {
  var a_list   = getAList<A>(new A());
  var b_list   = getAList<B>(new B());
  var c_list   = getAList<C>(new C());
  var int_list = getAList<int>(12);
  var str_list = ["string"];
  A a = new A();
  B b = new B();
  C c = new C();

  Set set1 = <int>{2, 7, ...int_list, 4};
  Set set2 = <A>{a, ...a_list};
  Set set3 = <A>{a, ...b_list};
  Set set4 = <A>{a, c, ...c_list, b};
  Set set5 = <A>{a, b, c, ...c_list, new B(), ...a_list, ...b_list, new A()};
  Set set6 = <B>{b, ...b_list, c, ...c_list};
  Set set7 = {123, "123", null, a, ...a_list, ...?b_list, c, b, ...?c_list,
      ...str_list, ...int_list, null, 1499, []};
}
