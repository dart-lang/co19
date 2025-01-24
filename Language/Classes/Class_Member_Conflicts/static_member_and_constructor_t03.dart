// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `C` be a class. It is a compile-time error if `C` declares a
/// constructor named `C.n` and a static member with basename `n`.
///
/// @description Check that it is a compile-time error if class `C` declares a
/// redirecting constructor named `C.n` and a static member with basename `n`.
/// @author sgrekhov22@gmail.com

class C {
  C();

  C.s1() : this();
//  ^^
// [analyzer] unspecified
  static set s1(var value) {}
//           ^^
// [cfe] unspecified

  C.s2() : this();
//  ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  C.s3() : this();
//  ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  C.s4() : this();
//  ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  C.s5() : this();
//  ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

enum E {
  e0;

  const E();

  const E.s1() : this();
//        ^^
// [analyzer] unspecified
  static set s1(var value) {}
//           ^^
// [cfe] unspecified

  const E.s2() : this();
//        ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  const E.s3() : this();
//        ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  const E.s4() : this();
//        ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  const E.s5() : this();
//        ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

extension type ET(int n) {
  ET.s1(int n) : this(n);
//   ^^
// [analyzer] unspecified
  static set s1(var _) {}
//           ^^
// [cfe] unspecified

  ET.s2(int n) : this(n);
//   ^^
// [analyzer] unspecified
  static void s2() {}
//            ^^
// [cfe] unspecified

  ET.s3(int n) : this(n);
//   ^^
// [analyzer] unspecified
  static int s3() => 1;
//           ^^
// [cfe] unspecified

  ET.s4(int n) : this(n);
//   ^^
// [analyzer] unspecified
  static int get s4 => 1;
//               ^^
// [cfe] unspecified

  ET.s5(int n) : this(n);
//   ^^
// [analyzer] unspecified
  static int s5 = 1;
//           ^^
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
