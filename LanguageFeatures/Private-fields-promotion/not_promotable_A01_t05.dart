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
/// @description Checks that an enum instance getter is not promotable
/// @author sgrekhov22@gmail.com

enum E1 {
  e1, e2;

  int? get _x => 42;

  void test() {
    if (_x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

enum E2<T> {
  e1<int?>(0), e2<num?>(null);

  final T t;
  const E2(this.t);

  T get _x => t;

  void test() {
    if (_x != null) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  if (E1.e1._x is int) {
    E1.e1._x.isEven;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var _e1 = E1.e1;
  if (_e1._x is int) {
    _e1._x.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  E1.e1.test();

  if (E2.e2._x != null) {
    E2.e2._x.isEven;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var _e2 = E2.e2;
  if (_e2._x != null) {
    _e2._x.isEven;
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  E2.e2.test();
}
