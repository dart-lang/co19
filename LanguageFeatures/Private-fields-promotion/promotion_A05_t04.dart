// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable only if
/// (a) it is private,
/// (b) it is final, and
/// (c) all other concrete instance getters with the same name in the same
/// library are also final fields
///
/// @description Checks that if there are other concrete instance getters with
/// the same name in the same library and they are not a final fields then the
/// field is not promotable. Test the case when there is a getter with the same
/// name in some extension in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

class A {}

class C<T> {
  final T _x;
  C(this._x);

  void testC() {
    if (_x is int) {
      _x.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension on A {
  String get _x => "Lily was here";
}

main() {
  A();
  C(43).testC();
}
