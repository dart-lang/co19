// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test a representation variable vs other extension type
/// members conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class ContainsWildcardMethod {
  int _() => 0;
}

class ContainsWildcardGetter {
  ContainsWildcardGetter get _ => ContainsWildcardGetter();
}

class ContainsWildcardSetter {
  void set _(ContainsWildcardSetter v) {}
}

extension type ET1(int _) {
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1Implements (ContainsWildcardMethod _)
      implements ContainsWildcardMethod {} // Ok

extension type ET2(int _) {
  int get _ => 7;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2Implements (ContainsWildcardGetter _)
      implements ContainsWildcardGetter {} // Ok

extension type ET3(int _) {
  void set _(int v) {} // Ok
}

extension type ET3Implements (ContainsWildcardSetter _)
      implements ContainsWildcardSetter {} // Ok

main() {
  print(ET1);
  print(ET1Implements);
  print(ET2);
  print(ET2Implements);
  print(ET3);
  print(ET3Implements);
}
