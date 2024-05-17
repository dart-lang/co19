// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test an instance variable vs other mixin members conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class ContainsWildcardVariable {
  int _ = 0;
}

class ContainsWildcardMethod {
  int _() => 0;
}

class ContainsWildcardGetter {
  int get _ => 0;
}

class ContainsWildcardSetter {
  void set _(int v) {}
}

mixin M1 {
  int _ = 1;
  int _ = 5;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1On on ContainsWildcardVariable {
  int _ = 1; // Ok
}

mixin M1Implements implements ContainsWildcardVariable {
  int _ = 1; // Ok
}

mixin M2 {
  int _ = 1;
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2On on ContainsWildcardMethod {
  int _ = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2Implements implements ContainsWildcardMethod {
  int _ = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3 {
  int _ = 1;
  int get _ => 7;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3On on ContainsWildcardGetter {
  int _ = 1; // Ok
}

mixin M3Implements implements ContainsWildcardGetter {
  int _ = 1; // Ok
}

mixin M4 {
  int _ = 1;
//    ^
// [cfe] unspecified
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M4On on ContainsWildcardSetter {
  int _ = 1; // Ok
}

mixin M4Implements implements ContainsWildcardSetter {
  int _ = 1; // Ok
}

main() {
  print(M1);
  print(M1On);
  print(M1Implements);
  print(M2);
  print(M2On);
  print(M2Implements);
  print(M3);
  print(M3On);
  print(M3Implements);
  print(M4);
  print(M4On);
  print(M4Implements);
}
