// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion AIt is a compile-time error if a parameterized type [T] is
/// super-bounded when it is used in any of the following ways:
///   ...
///   [T] is an immediate subterm of a redirecting factory constructor signature
/// @description Checks that compile error is thrown when raw type [T] is used in
/// the redirecting factory constructor signature
/// @Issue 34714,37037,41895
/// @author iarkh@unipro.ru


class A<X> {
  A() {}
  factory A.foo1() = C;
  factory A.foo2() = C<A>;
//                   ^^^^
// [analyzer] COMPILE_TIME_ERROR.REDIRECT_TO_INVALID_RETURN_TYPE
// [cfe] The constructor function type 'C<A<dynamic>> Function()' isn't a subtype of 'A<X> Function()'.
  factory A.foo3() = C<A<A>>;
//                   ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.REDIRECT_TO_INVALID_RETURN_TYPE
// [cfe] The constructor function type 'C<A<A<dynamic>>> Function()' isn't a subtype of 'A<X> Function()'.
  factory A.foo4() = C<A<A<A>>>;
//                   ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.REDIRECT_TO_INVALID_RETURN_TYPE
// [cfe] The constructor function type 'C<A<A<A<dynamic>>>> Function()' isn't a subtype of 'A<X> Function()'.
}

class C<X> extends A<X> {
  C() {}
}

main() {}
