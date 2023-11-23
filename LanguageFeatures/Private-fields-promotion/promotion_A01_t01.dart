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
/// conditions above are met
/// @author sgrekhov22@gmail.com

class C {
  final int? _x;
  final int? _y = 42;
  C(this._x);

  void test() {
    if (_x != null) {
      _x.isOdd;
    }
    if (_y != null) {
      _y.isOdd;
    }
  }
}

C c1 = C(1);

main() {
  C c = C(42);
  if (c._x != null) {
    c._x.isOdd;
  }
  if (c._y != null) {
    c._y.isOdd;
  }
  c.test();
}
