// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a spread element in a list or set literal has static type
/// [Iterable<T>] for some [T], then the upwards inference element type is [T].
/// @description Checks that spread element upwards inference element type is [T]
/// in the set literal
/// @author iarkh@unipro.ru

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
  Expect.runtimeIsType<Set<int>>({...int_list});
  Expect.isTrue({"test", "a", ...?str_list, "ooooo"} is Set<String>);
//                            ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                ^
// [cfe] Operand of null-aware operation '...?' has type 'List<String>' which excludes null.
  Expect.runtimeIsType<Set<String>>({"test", "a", ...?str_list, "ooooo"});
//                                                ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                    ^
// [cfe] Operand of null-aware operation '...?' has type 'List<String>' which excludes null.

  Expect.isTrue({...a_list} is Set<A>);
  Expect.runtimeIsType<Set<A>>({...a_list});
  Expect.isTrue({a, ...?a_list} is Set<A>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                      ^
// [cfe] Operand of null-aware operation '...?' has type 'List<A>' which excludes null.
  Expect.runtimeIsType<Set<A>>({a, ...?a_list});
//                                 ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                     ^
// [cfe] Operand of null-aware operation '...?' has type 'List<A>' which excludes null.
  Expect.isTrue({...b_list} is Set<A>);
  Expect.runtimeIsType<Set<A>>({...b_list});
  Expect.isTrue({a, ...?b_list} is Set<A>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                      ^
// [cfe] Operand of null-aware operation '...?' has type 'List<B>' which excludes null.
  Expect.runtimeIsType<Set<A>>({a, ...?b_list});
//                                 ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                     ^
// [cfe] Operand of null-aware operation '...?' has type 'List<B>' which excludes null.
  Expect.isTrue({...c_list} is Set<A>);
  Expect.runtimeIsType<Set<A>>({...c_list});
  Expect.isTrue({a, ...?c_list} is Set<A>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                      ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.runtimeIsType<Set<A>>({a, ...?c_list});
//                                 ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                     ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.isTrue({a, ...a_list, ...b_list, b} is Set<A>);
  Expect.runtimeIsType<Set<A>>({a, ...a_list, ...b_list, b});
  Expect.isTrue({a, b, c, ...a_list, ...b_list, ...?c_list} is Set<A>);
//                                              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                  ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.runtimeIsType<Set<A>>({a, b, c, ...a_list, ...b_list, ...?c_list});
//                                                             ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                                 ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.isTrue({a, ...a_list, ...b_list, b} is Set<A>);
  Expect.runtimeIsType<Set<A>>({a, ...a_list, ...b_list, b});

  Expect.isFalse({...a_list} is Set<B>);
  Expect.runtimeIsNotType<Set<B>>({...a_list});
  Expect.isFalse({b, ...?a_list} is Set<B>);
//                   ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                       ^
// [cfe] Operand of null-aware operation '...?' has type 'List<A>' which excludes null.
  Expect.runtimeIsNotType<Set<B>>({b, ...?a_list});
//                                    ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                        ^
// [cfe] Operand of null-aware operation '...?' has type 'List<A>' which excludes null.
  Expect.isTrue({...b_list} is Set<B>);
  Expect.runtimeIsType<Set<B>>({...b_list});
  Expect.isTrue({b, ...?b_list} is Set<B>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                      ^
// [cfe] Operand of null-aware operation '...?' has type 'List<B>' which excludes null.
  Expect.runtimeIsType<Set<B>>({...?b_list});
//                              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                  ^
// [cfe] Operand of null-aware operation '...?' has type 'List<B>' which excludes null.
  Expect.isTrue({...c_list} is Set<B>);
  Expect.runtimeIsType<Set<B>>({...c_list});
  Expect.isTrue({b, ...?c_list} is Set<B>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                      ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.runtimeIsType<Set<B>>({...?c_list});
//                              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                  ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.isFalse({c, ...a_list, ...b_list, b} is Set<B>);
  Expect.runtimeIsNotType<Set<B>>({c, ...a_list, ...b_list, b});
  Expect.isFalse({b, c, ...a_list, ...b_list, ...?c_list} is Set<B>);
//                                            ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.runtimeIsNotType<Set<B>>({b, c, ...a_list, ...b_list, ...?c_list});
//                                                             ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                                 ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.isTrue({b, ...c_list, ...b_list, b} is Set<B>);
  Expect.runtimeIsType<Set<B>>({b, ...c_list, ...b_list, b});

  Expect.isFalse({...a_list} is Set<C>);
  Expect.runtimeIsNotType<Set<C>>({...a_list});
  Expect.isFalse({c, ...?a_list} is Set<C>);
//                   ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                       ^
// [cfe] Operand of null-aware operation '...?' has type 'List<A>' which excludes null.
  Expect.runtimeIsNotType<Set<C>>({c, ...?a_list});
//                                    ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                        ^
// [cfe] Operand of null-aware operation '...?' has type 'List<A>' which excludes null.
  Expect.isFalse({...b_list} is Set<C>);
  Expect.runtimeIsNotType<Set<C>>({c, ...b_list});
  Expect.isFalse({c, ...?b_list} is Set<C>);
//                   ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                       ^
// [cfe] Operand of null-aware operation '...?' has type 'List<B>' which excludes null.
  Expect.runtimeIsNotType<Set<C>>({c, ...?b_list});
//                                    ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                        ^
// [cfe] Operand of null-aware operation '...?' has type 'List<B>' which excludes null.
  Expect.isTrue({...c_list} is Set<C>);
  Expect.runtimeIsType<Set<C>>({...c_list});
  Expect.isTrue({...?c_list} is Set<C>);
//               ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                   ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.runtimeIsType<Set<C>>({...?c_list});
//                              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                  ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.isTrue({c, ...?c_list} is Set<C>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                      ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.runtimeIsType<Set<C>>({c, ...?c_list});
//                                 ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                     ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.isFalse({c, ...a_list, ...b_list, c} is Set<C>);
  Expect.runtimeIsNotType<Set<C>>({c, ...a_list, ...b_list, c});
  Expect.isFalse({c, ...a_list, ...b_list, ...?c_list} is Set<C>);
//                                         ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                             ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.runtimeIsNotType<Set<C>>({c, ...a_list, ...b_list, ...?c_list});
//                                                          ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                              ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
  Expect.isFalse({a, ...c_list, ...b_list, b} is Set<C>);
  Expect.runtimeIsNotType<Set<C>>({a, ...c_list, ...b_list, b});
}
