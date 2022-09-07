// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type inference and promotion flows through records in much the 
/// same way it does for instances of generic classes (which are covariant in 
/// Dart just like record fields are) and collection literals.
///
/// @description Checks private fields promotion for records.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records,inference-update-2

class C {
  final (num, Object?)? _x;
  final (num, {Object? o})? _y;
  final ({num n, Object? o})? _z;
  C(this._x, this._y, this._z);

  void test() {
    if (_x != null) {
      _x.$0.sign;
      _x.$1?.toString();
    }
    if (_x is (int, String?)) {
      _x.$0.isOdd;
      _x.$1?.substring(0);
    }
    if (_y != null) {
      _y.$0.sign;
      _y.o?.toString();
    }
    if (_y is (int, {String o})) {
      _y.$0.isOdd;
      _y.o.substring(0);
    }
    if (_z != null) {
      _z.n.sign;
      _z.o?.toString();
    }
    if (_z is ({int n, String? o})) {
      _z.n.isOdd;
      _z.o?.substring(0);
    }
  }
}

main() {
  C((42, "answer"), (3.14, o: "pi"), null).test();
}
