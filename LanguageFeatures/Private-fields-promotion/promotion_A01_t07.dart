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
/// `target` is a static constant field. Test enum.
/// See https://github.com/dart-lang/language/issues/3326
/// @author sgrekhov22@gmail.com
/// @issue 53437

enum E {
  e1, e2;

  final int? _x = 42;

  void test() {
    if (_x != null) {
      _x.isOdd; // Ok, `target` is `this`
    }
  }
}

main() {
  var e = E.e1;
  if (e._x != null) {
    e._x.isEven;  // Ok, `target` is a local variable
  }
  E.e1.test();
  if (E.e1._x != null) {
    E.e1._x.isEven;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
