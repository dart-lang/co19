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
/// the field is not promotable. Test that in this case extension type
/// representation variable is still promotable
/// @author sgrekhov22@gmail.com
/// @issue 53439

// SharedOptions=--enable-experiment=inline-class

class C<T> {
  final T _x;
  C(this._x);
}

mixin M {
  final int _x = 42;
}

enum E {
  e1, e2;
  final int _x = 42;
}

extension type ET1(int? _x) {
  void test() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

extension type ET2<T>(T _x) {
  void test() {
    if (_x is int) {
      _x.isOdd;
    }
  }
}

main() {
  ET1 et1 = ET1(1);
  if (et1._x != null) {
    et1._x.isEven;
  }
  et1.test();

  ET2 et2 = ET2<int>(2);
  if (et2._x is int) {
    et2._x.isEven;
  }
  et2.test();
}
