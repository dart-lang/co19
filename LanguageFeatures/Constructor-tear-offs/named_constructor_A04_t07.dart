// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly, [params] is almost exactly the same parameter list
/// as the constructor [C.name], with the one exception that initializing
/// formals are represented by normal parameters with the same name and type.
/// All remaining properties of the parameters are the same as for the
/// corresponding constructor parameter, including any default values, and
/// [args] is an argument list passing those parameters to [C.name] directly as
/// they are received.
///
/// @description Checks statically that initializing formals are represented by
/// normal parameters with the same name and type.


class C {
  int x;
  dynamic y;
  C.name(this.x, this.y);
}

main() {
  C Function(int x, dynamic y) f1 = C.name;

  C Function(num x, dynamic y) f2 = C.name;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  C Function() f3 = C.name;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  C Function(int, dynamic, void) f4 = C.name;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
}
