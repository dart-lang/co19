// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable only if
/// (a) it is private,
/// (b) it is final, and
/// (c) all other concrete instance getters with the same name in the same
/// library are also final fields
///
/// @description Checks that an instance field is promotable if all of the
/// conditions above are met. Test the case when library imports another library
/// which contains a class with variable with the same name but not final
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

library promotion_A06_t04;

import "promotion_A06_t04.lib.dart";

class A {
  final int? _x = 42;

  void testA() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

main() {
  A().testA();
  C().testC();
}
