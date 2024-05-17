// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test an instance setter vs other mixin members conflict.
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
  void set _(int v) {}
//         ^
// [cfe] unspecified
  int _ = 5;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1On on ContainsWildcardVariable {
  void set _(int v) {} // Ok
}

mixin M1Implements implements ContainsWildcardVariable {
  void set _(int v) {} // Ok
}

mixin M2 {
  void set _(int v) {}
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2On on ContainsWildcardMethod {
  void set _(int v) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2Implements implements ContainsWildcardMethod {
  void set _(int v) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3 {
  void set _(int v) {}
  int get _ => 7; // Ok
}

mixin M3On on ContainsWildcardGetter {
  void set _(int v) {} // Ok
}

mixin M3Implements implements ContainsWildcardGetter {
  void set _(int v) {} // Ok
}

mixin M4 {
  void set _(int v) {}
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M4On on ContainsWildcardSetter {
  void set _(int v) {} // Ok
}

mixin M4Implements implements ContainsWildcardSetter {
  void set _(int v) {} // Ok
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
