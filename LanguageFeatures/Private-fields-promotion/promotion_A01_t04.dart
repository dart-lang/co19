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
/// @description Checks that an instance field is promotable if all of the
/// conditions above are met. Test the case when there are other concrete
/// instance getters with the same name in the same library and they are also
/// final fields
/// @author sgrekhov22@gmail.com

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
    if (super._x != null) {
      super._x.isOdd;
    }
  }
}

main() {
  A a = A(42);
  if (a._x is int) {
    a._x.isEven;
  }
  a.testA();

  B b = B("X");
  if (b._x is String) {
    b._x.substring(0);
  }
  b.testB();
  C c = C(1);
  if (c._x is int) {
    c._x.isEven;
  }
  c.testC();
}
