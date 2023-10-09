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

// SharedOptions=--enable-experiment=inline-class

class C<T> {
  final T _x;
  C(this._x);

  void testC() {
    if (_x is int) {
      _x.isOdd;
    }
  }
}

extension type ET1(int id) {
  String get _x => "Lily was here";
}

extension type ET2(int _x) {}

main() {
  C<num?> c = C(43);
  if (c._x is int) {
    c._x.isEven;
  }
  c.testC();
}
