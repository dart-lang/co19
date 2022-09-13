// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a list or set literal has a downwards inference type of
/// [Iterable<T>] for some [T], then the downwards inference context type of a
/// spread element in that list is [Iterable<T>].
/// @description Checks statically that a spread element inference context type
/// is [T] in the set literal
/// @author iarkh@unipro.ru


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

  Set set1  = <int>{...str_list};
//                     ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'String' to collection elements of type 'int'.
  Set set2  = <int>{1, 2, ...a_list, 14};
//                           ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'A' to collection elements of type 'int'.
  Set set3 = <int>{1, 14, 0, ...c_list};
//                              ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'C' to collection elements of type 'int'.
  Set set4 = <A>{...int_list};
//                  ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'int' to collection elements of type 'A'.
  Set set5 = <A>{...?str_list};
//                   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
