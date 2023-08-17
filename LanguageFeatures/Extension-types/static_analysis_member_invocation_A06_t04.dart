// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has a non-extension
/// type member named n in the case where DV does not declare a member named n,
/// but DV has a direct extension type superinterface V that has a non-extension
/// type member named n, or DV has a direct non-extension type superinterface T
/// whose interface contains a member signature named n.
///
/// @description Checks that method inherited from superinterface can be
/// abstract
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

abstract class A {
  int m();
}

abstract class B extends A {}

class C implements B {
  int m() => 42;
}

extension type ET(B id) implements A {}

main() {
  Expect.equals(42, ET(C()).m());
}
