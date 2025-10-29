// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The instance variable initialized by the parameter (and declared by it, if
///   the parameter is a field parameter), has the private name `p`.
///
/// @description For an instance variable with a private name `p` which is
/// introduced by a declaring parameter, check that it is a compile-time error
/// to use the corresponding public name `n` to access the instance variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

class C {
  String _p;

  C({this._p = "_p"});
  C.named({required this._p});
}

extension type ET._(String _p) {
  ET({this._p = "_p"});
  ET.named({required this._p});
}

enum E {
  e0, e1(p: "one"), e2.named(p: "1");

  final String _p;

  const E({this._p = "_p"});
  const E.named({required this._p});
}

main() {
  C().p;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  C(p: "").p;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  C.named(p: "").p;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  ET().p;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  ET(p: "").p;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  ET.named(p: "").p;
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  E.e0.p;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  E.e1.p;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  E.e2.p;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
