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
/// @descriptionChecks that if there is a getter with the same name in some
/// abstract class in the same library then the field is not promotable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

class A<T> {
  T _x;
  A(this._x);

  void testA() {
    if (_x is int) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

abstract class C<T> {
  T get _x;
}

main() {
  A<num?> a = A(42);
  if (a._x is int) {
    a._x.isEven;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  a.testA();
}
