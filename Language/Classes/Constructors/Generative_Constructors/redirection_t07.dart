// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generative constructor may be redirecting, in which case its
/// only action is to invoke another generative constructor. A redirecting
/// constructor has no body; instead, it has a redirect clause that specifies
/// which constructor the invocation is redirected to, and with what arguments.
/// redirection:
///   ':' this ('.' identifier)? arguments
/// ;
/// @description Checks that cyclic dependency in constructor redirection
/// produces a compile error (Using a longer redirection chain).
/// @author iefremov


class C {
  C.c0() : this.c9();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c1() : this.c0();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c2() : this.c1();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c3() : this.c2();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c4() : this.c3();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c5() : this.c4();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c6() : this.c5();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c7() : this.c6();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c8() : this.c7();
//         ^^^^^^^^^
// [analyzer] unspecified

  C.c9() : this.c8();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C.c0();
}
