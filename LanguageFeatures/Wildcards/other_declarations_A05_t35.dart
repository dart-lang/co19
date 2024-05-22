// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test an instance getter vs other extension type members
/// conflict.
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

extension type ET1(int id) {
  int get _ => 1;
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1Implements(ContainsWildcardMethod id)
      implements ContainsWildcardMethod {
  int get _ => 1; // Ok
}

extension type ET2(int id) {
  int get _ => 1;
  int get _ => 7;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2Implements(ContainsWildcardGetter id)
      implements ContainsWildcardGetter {
  int get _ => 1; // Ok
}

extension type ET3(int id) {
  int get _ => 1;
  void set _(int v) {} // Ok
}

extension type ET3Implements(ContainsWildcardSetter id)
      implements ContainsWildcardSetter {
  ContainsWildcardSetter get _ => ContainsWildcardSetter(); // Ok
}

main() {
  print(ET1);
  print(ET1Implements);
  print(ET2);
  print(ET2Implements);
  print(ET3);
  print(ET3Implements);
}
