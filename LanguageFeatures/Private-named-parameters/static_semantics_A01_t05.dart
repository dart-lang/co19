// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// - If `p` has no corresponding public name `n`, then compile-time error.
///
/// @description Check that it is a compile-time error if a declaring named
/// formal parameter of a primary constructor has a private name with no
/// corresponding public name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters,primary-constructors

class C1({var String __}) {
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2({required final String _}) {
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1({required final String __}) {
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(_: "");
//   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2({final String _ = ""}) {
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
}
