// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a spread element in a list or set literal has static type
/// [Iterable<T>] for some [T], then the upwards inference element type is [T].
///
/// @description Checks that spread element upwards inference element type is
/// [T] in the list literal
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

  Expect.isTrue([...int_list] is List<int>);
  Expect.runtimeIsType<List<int>>([...int_list]);
  Expect.isTrue(["test", "a", ...?str_list, "ooooo"] is List<String>);
//                            ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<String>>(["test", "a", ...?str_list, "ooooo"]);
//                                                 ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.isTrue([...a_list] is List<A>);
  Expect.runtimeIsType<List<A>>([...a_list]);
  Expect.isTrue([a, ...?a_list] is List<A>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<A>>([a, ...?a_list]);
//                                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.isTrue([...b_list] is List<A>);
  Expect.runtimeIsType<List<A>>([...b_list]);
  Expect.isTrue([a, ...?b_list] is List<A>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<A>>([a, ...?b_list]);
//                                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([...c_list] is List<A>);
  Expect.runtimeIsType<List<A>>([...c_list]);
  Expect.isTrue([a, ...?c_list] is List<A>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<A>>([a, ...?c_list]);
//                                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([a, ...a_list, ...b_list, b] is List<A>);
  Expect.runtimeIsType<List<A>>([a, ...a_list, ...b_list, b]);
  Expect.isTrue([a, b, c, ...a_list, ...b_list, ...?c_list] is List<A>);
//                                              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<A>>([a, b, c, ...a_list, ...b_list, ...?c_list]);
//                                                              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([a, ...a_list, ...b_list, b] is List<A>);
  Expect.runtimeIsType<List<A>>([a, ...a_list, ...b_list, b]);

  Expect.isFalse([...a_list] is List<B>);
  Expect.runtimeIsNotType<List<B>>([...a_list]);
  Expect.isFalse([b, ...?a_list] is List<B>);
//                   ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsNotType<List<B>>([b, ...?a_list]);
//                                     ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([...b_list] is List<B>);
  Expect.runtimeIsType<List<B>>([...b_list]);
  Expect.isTrue([b, ...?b_list] is List<B>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<B>>([b, ...?b_list]);
//                                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([...c_list] is List<B>);
  Expect.runtimeIsType<List<B>>([...c_list]);
  Expect.isTrue([b, ...?c_list] is List<B>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<B>>([b, ...?c_list]);
//                                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isFalse([c, ...a_list, ...b_list, b] is List<B>);
  Expect.runtimeIsNotType<List<B>>([c, ...a_list, ...b_list, b]);
  Expect.isFalse([b, c, ...a_list, ...b_list, ...?c_list] is List<B>);
//                                            ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsNotType<List<B>>([b, c, ...a_list, ...b_list, ...?c_list]);
//                                                              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([b, ...c_list, ...b_list, b] is List<B>);
  Expect.runtimeIsType<List<B>>([b, ...c_list, ...b_list, b]);

  Expect.isFalse([...a_list] is List<C>);
  Expect.runtimeIsNotType<List<C>>([...a_list]);
  Expect.isFalse([c, ...?a_list] is List<C>);
//                   ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsNotType<List<C>>([c, ...?a_list]);
//                                     ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isFalse([...b_list] is List<C>);
  Expect.runtimeIsNotType<List<C>>([...b_list]);
  Expect.isFalse([c, ...?b_list] is List<C>);
//                   ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsNotType<List<C>>([c, ...?b_list]);
//                                     ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([...c_list] is List<C>);
  Expect.runtimeIsType<List<C>>([...c_list]);
  Expect.isTrue([...?c_list] is List<C>);
//               ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<C>>([...?c_list]);
//                               ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue([c, ...?c_list] is List<C>);
//                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<List<C>>([c, ...?c_list]);
//                                  ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isFalse([c, ...a_list, ...b_list, c] is List<C>);
  Expect.runtimeIsNotType<List<C>>([c, ...a_list, ...b_list, c]);
  Expect.isFalse([c, ...a_list, ...b_list, ...?c_list] is List<C>);
//                                         ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsNotType<List<C>>([c, ...a_list, ...b_list, ...?c_list] );
//                                                           ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isFalse([a, ...c_list, ...b_list, b] is List<C>);
  Expect.runtimeIsNotType<List<C>>([a, ...c_list, ...b_list, b]);
}
