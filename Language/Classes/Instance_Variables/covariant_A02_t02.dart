// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is possible for the declaration of an instance variable to
/// include the modifier covariant. The effect of this is that the formal
/// parameter of the corresponding implicitly induced setter is considered to be
/// covariant-by-declaration
///
/// @description Checks that if an instance variable can be declared as a
/// covariant
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class A {
  var v = 1 as num;
}

class C extends A {
  covariant var v = 2;
}

main() {
  C().v = 3.14;
  Expect.throws(() {
    C().v = Object() as dynamic;
  });
}
