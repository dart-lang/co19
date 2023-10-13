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
/// `target` is a static field (even constant).
/// See https://github.com/dart-lang/language/issues/3326
/// @author sgrekhov22@gmail.com
/// @issue 53437

class C {
  static const c1 = C(1);
  static final c2 = C(2);
  static const _c3 = C(3);

  final int? _x;
  const C(this._x);
}

main() {
  var v1 = C.c1;
  if (v1._x != null) {
    v1._x.isEven;  // Ok, `target` is a local variable
  }
  var v2 = C.c2;
  if (v2._x != null) {
    v2._x.isEven;  // Ok, `target` is a local variable
  }
  var v3 = C._c3;
  if (v3._x != null) {
    v3._x.isEven;  // Ok, `target` is a local variable
  }
  if (C.c1._x != null) {
    C.c1._x.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (C.c2._x != null) {
    C.c2._x.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (C._c3._x != null) {
    C._c3._x.isEven;
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
