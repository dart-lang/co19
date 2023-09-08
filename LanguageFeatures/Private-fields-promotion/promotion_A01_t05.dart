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
/// conditions above are met. Test that the right variable is promoted
/// @author sgrekhov22@gmail.com
/// @issue 53436

// SharedOptions=--enable-experiment=inference-update-2

class A {
  final int? _x;
  A(this._x);
}

class C extends A {
  final int? _x;
  C(this._x) : super(_x);

  void testC() {
    if (_x != null) {
      super._x.isOdd;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    if (super._x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

mixin M on A {
  final int? _x = 0;

  void testM() {
    if (_x != null) {
      super._x.isOdd;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    if (super._x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

class MA = A with M;

main() {
  C c = C(42);
  if (c._x is int) {
    c._x.isEven;
  }
  c.testC();

  MA ma = MA(42);
  if (ma._x is int) {
    ma._x.isEven;
  }
  ma.testM();
}
