// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
///   ...
/// - `T` is an immediate subterm of a redirecting factory constructor signature
///
/// @description Checks that it is a compile-time error if a super-bounded type
/// is an immediate subterm of a redirecting factory constructor signature
/// @author iarkh@unipro.ru

class A<X> {
  A() {}
  factory A.foo1() = C<dynamic>;
//                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo2() = C<Object?>;
//                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo3() = C<void>;
//                   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo4() = C<A<dynamic>>;
//                   ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo5() = C<A<Object?>>;
//                   ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo6() = C<A<void>>;
//                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo7() = C<A<A<dynamic>>>;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo8() = C<A<A<Object?>>>;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo9() = C<A<A<void>>>;
//                   ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C<X extends A<X>> extends A<X> {
  C() {}
}

main() {}
