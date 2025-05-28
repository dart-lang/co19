// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test a static method vs other class members conflict.
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
  static int _() => 1;
  static int _ = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  static int _() => 1;
  static int _() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  static int _() => 1;
  static int get _ => 3;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  static int _() => 1;
  static void set _(int v) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5 {
  static int _() => 1;
//           ^
// [analyzer] unspecified
  int _ = 5;
//    ^
// [cfe] unspecified
}

class C5Extends extends ContainsWildcardVariable {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5Implements extends ContainsWildcardVariable {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5With with ContainsWildcardVariable {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 {
  static int _() => 1;
//           ^
// [analyzer] unspecified
  int _() => 6;
//    ^
// [cfe] unspecified
}

class C6Extends extends ContainsWildcardMethod {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6Implements extends ContainsWildcardMethod {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6With with ContainsWildcardMethod {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7 {
  static int _() => 1;
//           ^
// [analyzer] unspecified
  int get _ => 7;
//        ^
// [cfe] unspecified
}

class C7Extends extends ContainsWildcardGetter {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7Implements extends ContainsWildcardGetter {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7With with ContainsWildcardGetter {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8 {
  static int _() => 1;
//           ^
// [analyzer] unspecified
  void set _(int v) {}
//         ^
// [cfe] unspecified
}

class C8Extends extends ContainsWildcardSetter {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8Implements extends ContainsWildcardSetter {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8With with ContainsWildcardSetter {
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C5Extends);
  print(C5Implements);
  print(C5With);
  print(C6);
  print(C6Extends);
  print(C6Implements);
  print(C6With);
  print(C7);
  print(C7Extends);
  print(C7Implements);
  print(C7With);
  print(C8);
  print(C8Extends);
  print(C8Implements);
  print(C8With);
}
