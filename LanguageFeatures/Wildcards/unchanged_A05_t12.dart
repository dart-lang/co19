// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test an instance method vs other class members conflict.
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
  int _() => 1;
  int _ = 5;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C1Extends extends ContainsWildcardVariable {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C1Implements extends ContainsWildcardVariable {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C1With with ContainsWildcardVariable {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  int _() => 1;
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2Extends extends ContainsWildcardMethod {
  int _() => 1; // OK
}

class C2Implements extends ContainsWildcardMethod {
  int _() => 1; // OK
}

class C2With with ContainsWildcardMethod {
  int _() => 1; // OK
}

class C3 {
  int _() => 1;
  int get _ => 7;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3Extends extends ContainsWildcardGetter {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3Implements extends ContainsWildcardGetter {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3With with ContainsWildcardGetter {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  int _() => 1;
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4Extends extends ContainsWildcardSetter {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4Implements extends ContainsWildcardSetter {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4With with ContainsWildcardSetter {
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
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
