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
/// @description Checks that expression `target._fieldName` is not promotable if
/// `target` is a static constant field. Test a generic enum.
/// See https://github.com/dart-lang/language/issues/3326
/// @author sgrekhov22@gmail.com
/// @issue 53437

enum E<T> {
  e1<num?>(1), e2<int?>(2);

  const E(this._x);
  final T _x;

  void test() {
    if (_x is int) {
      _x.isOdd; // Ok, `target` is `this`
    }
  }
}

main() {
  var _e1 = E.e1;
  if (_e1._x is int) {
    _e1._x.isEven;  // Ok, `target` is a local variable
  }
  E.e1.test();
  if (E.e1._x is int) {
    E.e1._x.isEven;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var _e2 = E.e2;
  if (_e2._x != null) {
    _e2._x.isEven;  // Ok, `target` is a local variable
  }
  E.e2.test();
  if (E.e2._x != null) {
    E.e2._x.isEven;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
