// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Null: if T0 is Null then:
/// - if T1 is a type variable (promoted or not) the query is false
/// - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
/// - If T1 is Null, S? or S* for some S, then the query is true.
/// - Otherwise, the query is false
/// @description Check that if type T0 is Null and T1 is a type variable then T0
/// is not subtype of a type T1.
/// @author sgrekhov@unipro.ru

class T1 {}

T test<T>(T t, Null n) {
  t = n;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  foo<T>(n);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  return n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

foo<T>(T t) {}

main() {
  test<T1>(new T1(), null);
}
