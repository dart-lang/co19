// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// - If `p` has no corresponding public name `n`, then compile-time error.
///
/// @description Check that it is a compile-time error if a named initializing
/// formal parameter has a private name that has no corresponding public name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

class C {
  String _p;
  C({this.__p = ""});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C._({required this.__p});
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(String _p) {
  ET({this.__p = ""});
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.named({required this.__p});
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  final String _p;
  const E({this.__p = ""});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  const E.named({required this.__p});
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
  print(E);
}
