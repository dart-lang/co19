// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error if an extension type has an instance getter
/// named `g` with return type `R` and a setter named `g=` with parameter type
/// `S`, and `R` is not a subtype of `S`.
///
/// @description Checks that it is not an error error if an extension type
/// declares an instance setter with the same basename as the instance getter
/// but with an incompatible type
/// @author sgrekhov22@gmail.com
/// @issue 53489

import '../../Utils/expect.dart';

extension type I(int id) {
  void set x(String i) {}
}

extension type ET1(int id) {
  void set x(String i) {}
  int get x => 42;
}

extension type ET2(int id) implements I {
  int get x => 42;
}

main() {
  ET1 et1 = ET1(1);
  Expect.equals(42, et1.x);
  et1.x = "42";
  Expect.equals(42, et1.x);

  ET2 et2 = ET2(2);
  Expect.equals(42, et2.x);
  et2.x = "42";
  Expect.equals(42, et2.x);
}
