// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if there are other concrete class instance getters
/// with the same name in the same library and they are not final fields then
/// the field is not promotable. Test the case when there is a member with the
/// same name in some extension type in the same library. In this case promotion
/// is allowed
/// @author sgrekhov22@gmail.com
/// @issue 53436

// SharedOptions=--enable-experiment=inline-class

import "dart:math";

mixin M {
  final num? _x = 42;

  void testM() {
    if (_x is int) {
      _x.isOdd;
    }
  }
}

class MA = Object with M;

extension type ET1(int id) {
  num? get _x => Random().nextBool() ? null : 42;
}

extension type ET2(int _x) {}

main() {
  MA ma = MA();
  if (ma._x is int) {
    ma._x.isEven;
  }
  ma.testM();
}
