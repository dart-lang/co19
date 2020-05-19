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

class A<X> {
  A() {}
  factory A.foo1() = C<dynamic>;       //# 01: compile-time error
  factory A.foo2() = C<Object>;        //# 02: compile-time error
  factory A.foo3() = C<void>;          //# 03: compile-time error
  factory A.foo4() = C<A<dynamic>>;    //# 04: compile-time error
  factory A.foo5() = C<A<Object>>;     //# 05: compile-time error
  factory A.foo6() = C<A<void>>;       //# 06: compile-time error
  factory A.foo7() = C<A<A<dynamic>>>; //# 07: compile-time error
  factory A.foo8() = C<A<A<Object>>>;  //# 08: compile-time error
  factory A.foo9() = C<A<A<void>>>;    //# 09: compile-time error
}

class C<X extends A<X>> extends A<X> {
  C() {}
}

main() {}
