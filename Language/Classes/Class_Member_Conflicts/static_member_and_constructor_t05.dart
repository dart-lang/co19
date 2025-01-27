// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `C` be a class. It is a compile-time error if `C` declares a
/// constructor named `C.n` and a static member with basename `n`.
///
/// @description Check that it is a compile-time error if class `C` declares a
/// non-redirecting factory constructor named `C.n` and a static member with
/// basename `n`.
/// @author sgrekhov22@gmail.com

class C {
  C();

  factory C.s1() => C();
//          ^^
// [analyzer] unspecified
  static set s1(var value) {}
//           ^^
// [cfe] unspecified

  factory C.s2() => C();
//          ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  factory C.s3() => C();
//          ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  factory C.s4() => C();
//          ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  factory C.s5() => C();
//          ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

extension type ET(int n) {
  factory ET.s1(int n) => ET(n);
//           ^^
// [analyzer] unspecified
  static set s1(var _) {}
//           ^^
// [cfe] unspecified

  factory ET.s2(int n) => ET(n);
//           ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  factory ET.s3(int n) => ET(n);
//           ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  factory ET.s4(int n) => ET(n);
//           ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  factory ET.s5(int n) => ET(n);
//           ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
