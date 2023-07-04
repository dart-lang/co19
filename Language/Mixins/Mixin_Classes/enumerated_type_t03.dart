// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let D be a mixin application class declaration of the form
/// abstract? class N = S with M1, ..., Mn implements I1, ..., Ik;
/// It is a compile-time error if S is an enumerated type.
///
/// @description Checks that it is a compile-time error if `S` is an enumerated
/// type
/// @author sgrekhov@unipro.ru

enum E {a, b, c}

mixin class M {
}

class C = E with M;
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
//     ^
// [cfe] unspecified
}
