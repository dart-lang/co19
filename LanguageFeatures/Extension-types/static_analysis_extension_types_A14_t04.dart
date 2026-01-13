// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type declaration `DV`
/// has two extension type superinterfaces `V1` and `V2`, and both `V1` and `V2`
/// has an extension type member named `m` that is not precluded by `DV`, and
/// the two members have distinct declarations.
///
/// @description Checks that it is not an error if an extension type declaration
/// has a two extension type superinterfaces with a type member named `m`
/// inherited from a common extension type superinterface ("diamond"
/// inheritance)
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class A {
  String m() => "A";
}

extension type ET1(A a) implements A {}

extension type ET2(A a) implements A {}

extension type ET3(A a) implements ET1, ET2 {}

main() {
  Expect.equals("A", ET3(A()).m());
}
