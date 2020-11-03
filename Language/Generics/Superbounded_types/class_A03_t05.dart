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
 * @description Checks that compile error is thrown when raw type [T] is used in
 * the redirecting factory constructor signature
 * @Issue 34714,37037,41895
 * @author iarkh@unipro.ru
 */

class A<X extends A<X>> {
  A() {}
  factory A.foo1() = C;
  factory A.foo2() = C<A>;
// [error line 20, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo3() = C<A<A>>;
// [error line 24, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo4() = C<A<A<A>>>;
// [error line 28, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}

class C<X extends A<X>> extends A<X> {
  C() {}
}

main() {}
