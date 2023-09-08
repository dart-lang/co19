// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable if all the following conditions
/// hold:
/// - It refers to a field (not a getter)
/// - The field is private
/// - The field is final
/// - There is no getter with the same name elsewhere in the library
/// - There is no non-final field with the same name elsewhere in the library
/// - There is no implicit noSuchMethod forwarder with the same name elsewhere
///   in the library.
///
/// @description Checks that an instance field is promotable if all of the
/// conditions above are met. Test the case when library imports another library
/// which contains a class with variable with the same name but not final
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

library promotion_A03_t04;

import "promotion_A03_t04_lib.dart";

class A {
  final int? _x = 42;

  void testA() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

main() {
  A a = A();
  if (a._x is int) {
    a._x.isEven;
  }
  a.testA();
  C().testC();
}
