// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for a declaring parameter to be
/// declared with the name `_`, except when every element in the augmentation
/// chain for that formal parameter is declared with the name `_`.
///
/// @description Check that it is not an error if a declaring parameter is
/// declared with the name other than `_` and every element in the augmentation
/// chain for that formal parameter is declared with the name `_` or uses the
/// initial name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C1([var int? x]);
augment class C1([int? _]);
augment class C1([int? x]);
augment class C1([int? _]);

class C2([var int? _x]);
augment class C2([int? _]);
augment class C2([int? _x]);
augment class C2([int? _]);

class C3([var int? __]);
augment class C3([int? _]);
augment class C3([int? __]);
augment class C3([int? _]);

class C4([final int? x]);
augment class C4([int? _]);
augment class C4([int? x]);
augment class C4([int? _]);

class C5([final int? _x]);
augment class C5(int? _);
augment class C5(int? _x);
augment class C5(int? _);

class C6([final int? __]);
augment class C6([int? _]);
augment class C6([int? __]);
augment class C6([int? _]);

enum E1([final int? x]) {
  e0(1);
}
augment enum E1([int? _]) {;}
augment enum E1([int? x]) {;}
augment enum E1([int? _]) {;}

enum E2([final int? _x]) {
  e0(2);
}
augment enum E2([int? _]) {;}
augment enum E2([int? _x]) {;}
augment enum E2([int? _]) {;}

enum E3([final int? __]) {
  e0(3);
}
augment enum E3([int? _]) {;}
augment enum E3([int? __]) {;}
augment enum E3([int? _]) {;}

main() {
  Expect.equals(1, C1(1).x);
  Expect.equals(2, C2(2)._x);
  Expect.equals(3, C3(3).__);
  Expect.equals(4, C4(1).x);
  Expect.equals(5, C5(2)._x);
  Expect.equals(6, C6(3).__);
  Expect.equals(1, E1.e0.x);
  Expect.equals(2, E2.e0._x);
  Expect.equals(3, E3.e0.__);
}
