// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentation declarations interact with part files mainly in
/// restrictions on where an augmenting declaration may occur relative to the
/// declaration it augments.
///
/// @description Checks that declarations in the main library are visible in a
/// part file.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'defining_augmentation_A01_t02.dart';

import '../../Utils/expect.dart';

extension on C1 {
  String get z => "z";
}

extension on _C2 {
  String get _z => "_z";
}

extension type ET1(C1 id) {}
extension type ET2(_C2 id) {}

class MA1 = Object with M1;
class MA2 = Object with _M2;

test() {
  Expect.equals("y", C1().y);
  Expect.equals("z", C1().z);
  Expect.equals("m", MA1().m);
  Expect.equals("_y", _C2()._y);
  Expect.equals("_z", _C2()._z);
  Expect.equals("_m", MA2()._m);
  Expect.equals("y", ET1(C1()).id.y);
  Expect.equals("_y", ET2(_C2()).id._y);
  Expect.equals(E1.e, E1.e.instance);
  Expect.equals(_E2.e, _E2.e._instance);
  Expect.equals(42, x1);
  Expect.equals(42, _x2);
  Expect.equals(0, foo1());
  Expect.equals(0, _foo2());
  Expect.equals("bar", [].bar);
  Expect.equals("bar", MyList([]).bar);
  Expect.equals("_baz", [].baz);
  Expect.equals("_baz", _MyList([]).baz);
  Expect.equals(42, MyInt(42));
  Expect.equals(42, _MyInt(42));
  Expect.isTrue((Foo1 as dynamic) is Type);
  Expect.isTrue((_Foo2 as dynamic) is Type);
  Expect.isTrue((C1Alias as dynamic) is Type);
  Expect.isTrue((_C2Alias as dynamic) is Type);
}
