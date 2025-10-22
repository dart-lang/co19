// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// - If `p` has no corresponding public name `n`, then compile-time error.
///
/// @description Check that it is a compile-time error if a named initializing
/// formal parameter with private name has no corresponding public name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

class C {
  String __p;
  C({this._p = ""});
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  C._({required this._p});
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(String __p) {
  ET({this._p = ""});
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.named({required this._p});
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  final String __p;
  const E({this._p = ""});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  const E.named({required this._p});
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
  print(E);
}
