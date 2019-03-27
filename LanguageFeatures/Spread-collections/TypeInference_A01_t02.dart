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
 * the set literal
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

List getAList<T>(var a) { return <T>[a]; }

main() {
  List a_list   = getAList<A>(new A());
  List b_list   = getAList<B>(new B());
  List c_list   = getAList<C>(new C());
  List int_list = getAList<int>(12);
  List str_list = ["string"];
  A a = new A();
  B b = new B();
  C c = new C();

  Set set1 = <int>{2, 7, ...int_list, 4};
  Expect.isTrue(set1 is Set<int>);

  Set set2 = <A>{a, ...a_list};
  Expect.isTrue(set2 is Set<A>);

  Set set3 = <A>{a, ...b_list};
  Expect.isTrue(set3 is Set<A>);

  Set set4 = <A>{a, c, ...c_list, b};
  Expect.isTrue(set4 is Set<A>);

  Set set5 = <A>{a, b, c, ...c_list, new B(), ...a_list, ...b_list, new A()};
  Expect.isTrue(set5 is Set<A>);

  Set set6 = <B>{b, ...b_list, c, ...c_list};
  Expect.isTrue(set6 is Set<B>);

  Set set7 = {123, "123", null, a, ...a_list, ...?b_list, c, b, ...?c_list,
      ...str_list, ...int_list, null, 1499, []};
  Expect.isTrue(set7 is Set<Object>);

  Set set8;
  Expect.throws(() => set8 = <int>{...str_list});
  Expect.throws(() => set8 = <int>{1, 2, ...a_list, 14});
  Expect.throws(() => set8 = <int>{1, 14, 0, ...c_list});

  Expect.throws(() => set8 = <A>{...int_list});
  Expect.throws(() => set8 = <A>{...?str_list});

  Expect.throws(() => set8 = <B>{...a_list});
  Expect.throws(() => set8 = <B>{b, ...?a_list, c});

  Expect.throws(() => set8 = <C>{...b_list});
  Expect.throws(() => set8 = <C>{...a_list, ...?b_list});
}
