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
/// @description Checks statically that [params] is exactly the same parameter
/// list - test case with several argument.
/// @author iarkh@unipro.ru

class C {
  C.constr(int i, String j, List<int> l) {}
}

main() {
  C Function(int, String, List<int>) v1 = C.constr;

  C Function(int) v2 = C.constr;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  C Function(int, String) v3 = C.constr3;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  C Function(int, String, List) v4 = C.constr;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  C Function(int, String, List<int>, List) v5 = C.constr;
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  C Function(dynamic, dynamic, dynamic) v6 = C.constr;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}
