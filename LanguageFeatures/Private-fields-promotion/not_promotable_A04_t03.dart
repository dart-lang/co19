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
/// @description Checks that if there is a concrete instance getter with the
/// same name in some mixin in the same library then the field is not promotable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

class A {
  final int? _x = 42;

  void testA() {
    if (_x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

mixin M {
  String get _x => "Lily was here";
}

class MA = Object with M;

main() {
  A a = A();
  if (a._x is int) {
    a._x.isEven;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  a.testA();
  MA()._x; // to remove 'not used' hint
}
