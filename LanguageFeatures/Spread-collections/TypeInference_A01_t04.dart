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
 * is [T] in the list literal
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

  List list1 = <int>[...str_list];         //# 01: compile-time error
  List list2 = <int>[1, 2, ...a_list, 14]; //# 02: compile-time error
  List list3 = <int>[1, 14, 0, ...c_list]; //# 03: compile-time error

  List list4 = <A>[...int_list];           //# 04: compile-time error
  List list5 = <A>[...?str_list];          //# 05: compile-time error
}
