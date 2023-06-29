// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let D be a mixin application class declaration of the form
/// abstract? class N = S with M1, ..., Mn implements I1, ..., Ik;
/// ...
/// It is a compile-time error if any of M1, . . . , Mk is an enumerated type
///
/// @description Checks that it is a compile-time error if any of `Mi` is an
/// enumerated type
/// @author sgrekhov@unipro.ru

class S {
}

enum M {a, b, c}

class C = S with M;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
