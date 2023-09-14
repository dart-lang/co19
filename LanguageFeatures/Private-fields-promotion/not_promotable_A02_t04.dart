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
/// @description Checks that a late final instance field cannot be promoted by
/// writing to it. See
/// https://github.com/dart-lang/sdk/issues/50949#issuecomment-1708280192
/// @author sgrekhov22@gmail.com
/// @issue 50949

class C {
  late final int? _x;

  void test() {
    _x = 42;
    _x.isOdd;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C c = C();
  c._x = 0;
  c._x.isEven;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  c.test();
  c._x.isEven;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
