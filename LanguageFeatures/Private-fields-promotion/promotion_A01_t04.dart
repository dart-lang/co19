// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable only if
/// (a) it is private,
/// (b) it is final, and
/// (c) all other concrete instance getters with the same name in the same
/// library are also final fields
///
/// @description Checks that an instance field is promotable if all of the
/// conditions above are met. Test the case when there are other concrete
/// instance getters with the same name in the same library and they are also
/// final fields
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

class A {
  final int? _x;
  A(this._x);

  void testA() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

class B {
  final String? _x;
  B(this._x);

  void testB() {
    if (_x != null) {
      _x.substring(0);
    }
  }
}

class C extends A {
  final int? _x;
  C(this._x) : super(_x);

  void testC() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

main() {
  A(42).testA();
  B("X").testB();
  C(1).testC();
}
