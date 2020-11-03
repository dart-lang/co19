/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion AIt is a compile-time error if a parameterized type [T] is
 * super-bounded when it is used in any of the following ways:
 *   ...
 *   [T] is an immediate subterm of a redirecting factory constructor signature
 * @description Checks that compile error is thrown when super-bounded type [T]
 * is used in the redirecting factory constructor signature
 * @author iarkh@unipro.ru
 */

class A<X extends A<X>> {
  A() {}
  factory A.foo1() = C<dynamic>;
// [error line 18, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo2() = C<Object?>;
// [error line 22, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo3() = C<void>;
// [error line 26, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo4() = C<A<dynamic>>;
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo5() = C<A<Object?>>;
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo6() = C<A<void>>;
// [error line 38, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo7() = C<A<A<dynamic>>>;
// [error line 42, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo8() = C<A<A<Object?>>>;
// [error line 46, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo9() = C<A<A<void>>>;
// [error line 50, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}

class C<X extends A<X>> extends A<X> {
  C() {}
}

main() {}
