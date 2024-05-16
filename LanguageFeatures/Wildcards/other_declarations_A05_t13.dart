// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test an instance setter vs other class members conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

mixin class ContainsWildcardVariable {
  int _ = 0;
}

mixin class ContainsWildcardMethod {
  int _() => 0;
}

mixin class ContainsWildcardGetter {
  int get _ => 0;
}

mixin class ContainsWildcardSetter {
  void set _(int v) {}
}

class C1 {
  void set _(int v) {}
  int _ = 5;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C1Extends extends ContainsWildcardVariable {
  void set _(int v) {}  // Ok
}

class C1Implements extends ContainsWildcardVariable {
  void set _(int v) {} // Ok
}

class C1With with ContainsWildcardVariable {
  void set _(int v) {} // Ok
}

class C2 {
  void set _(int v) {}
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2Extends extends ContainsWildcardMethod {
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2Implements extends ContainsWildcardMethod {
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2With with ContainsWildcardMethod {
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  void set _(int v) {}
  int get _ => 7; // Ok
}

class C3Extends extends ContainsWildcardGetter {
  void set _(int v) {} // Ok
}

class C3Implements extends ContainsWildcardGetter {
  void set _(int v) {} // Ok
}

class C3With with ContainsWildcardGetter {
  void set _(int v) {} // Ok
}

class C4 {
  void set _(int v) {}
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4Extends extends ContainsWildcardSetter {
  void set _(int v) {}  // Ok
}

class C4Implements extends ContainsWildcardSetter {
  void set _(int v) {}  // Ok
}

class C4With with ContainsWildcardSetter {
  void set _(int v) {}  // Ok
}

main() {
  print(C1);
  print(C1Extends);
  print(C1Implements);
  print(C1With);
  print(C2);
  print(C2Extends);
  print(C2Implements);
  print(C2With);
  print(C3);
  print(C3Extends);
  print(C3Implements);
  print(C3With);
  print(C4);
  print(C4Extends);
  print(C4Implements);
  print(C4With);
}
