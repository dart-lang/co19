// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `C` be a class. It is a compile-time error if `C` declares a
/// constructor named `C.n` and a static member with basename `n`.
///
/// @description Check that it is a compile-time error if class `C` declares a
/// constant generative constructor named `C.n` and a static member with
/// basename `n`.
/// @author sgrekhov22@gmail.com

class C {
  const C.s1();
//        ^^
// [analyzer] unspecified
  static set s1(var value) {}
//           ^^
// [cfe] unspecified

  const C.s2();
//        ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  const C.s3();
//        ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  const C.s4();
//        ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  const C.s5();
//        ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

enum E {
  e0.s1();

  const E.s1();
//        ^^
// [analyzer] unspecified
  static set s1(var value) {}
//           ^^
// [cfe] unspecified

  const E.s2();
//        ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  const E.s3();
//        ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  const E.s4();
//        ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  const E.s5();
//        ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

extension type ET(int _) {
  const ET.s1(this._);
//         ^^
// [analyzer] unspecified
  static set s1(var _) {}
//           ^^
// [cfe] unspecified

  const ET.s2(this._);
//         ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  const ET.s3(this._);
//         ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  const ET.s4(this._);
//         ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  const ET.s5(this._);
//         ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
