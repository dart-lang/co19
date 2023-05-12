// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Map:
/// i. Calculate the value's entry key type K and value type V, and key context
///     C:
///   a. If p has type arguments <K, V> for some K and V then use those, and C
///     is K.
///   b. Else if M implements Map<K, V> for some K and V then use those, and C
///     is K.
///   c. Else if M is dynamic then K and V are dynamic and C is _.
///   d. Else K and V are Object? and C is _.
/// ii. Type-check each key expression using C as the context type.
/// iii. Type-check each value subpattern using V as the matched value type.
/// vi. The required type of p is Map<K, V>.
///
/// @description Check that each key expression is type checked using `C` as the
/// context type. Test the case when `p` has type arguments `<K, V>`
/// @author sgrekhov22@gmail.com

class A<T extends A<T>> {
  const A();
}

void test1() {
  switch ({} as dynamic) {
    case <A<dynamic>, String>{const A(): 1}:
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }
}

void test2() {
  if ({} as dynamic case <A<dynamic>, String>{const A(): 2}) {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

String test3() =>
  switch ({} as dynamic) {
    <A<dynamic>, String>{const A(): 3} => "match",
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "no match"
  };

main() {
  <A<dynamic>, String>{const A(): 3} = {} as dynamic;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  test1();
  test2();
  test3();
}
