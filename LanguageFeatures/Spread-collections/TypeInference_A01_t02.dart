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
// SharedOptions=--enable-experiment=spread-collections

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

List getAList<T>(var a) {
  List ret = new List<T>();
  ret.add(a);
  return ret;
}

main() {
  List a_list = getAList<A>(new A());
  List b_list = getAList<B>(new B());
  List c_list = getAList<C>(new C());
  List int_list= getAList<int>(12);
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

  Expect.throws(() => Set set8 = <int>{...str_list});
  Expect.throws(() => Set set9 = <int>{1, 2, ...a_list, 14});
  Expect.throws(() => Set set10 = <int>{1, 14, 0, ...c_list});

  Expect.throws(() => Set set11 = <A>{...int_list});
  Expect.throws(() => Set set12 = <A>{...?str_list});

  Expect.throws(() => Set set13 = <B>{...a_list});
  Expect.throws(() => Set set14 = <A>{b, ...?a_list, c});

  Expect.throws(() => Set set15 = <C>{...b_list});
  Expect.throws(() => Set set16 = <A>{...a_list, ...?b_list});
}
