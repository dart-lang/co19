// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for a declaring parameter to be
/// declared with the name `_`, except when every element in the augmentation
/// chain for that formal parameter is declared with the name `_`.
///
/// @description Check that it is not an error if a declaring parameter is
/// declared with the name `_` and every element in the augmentation chain for
/// that formal parameter uses the name `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C1(var int _);
augment class C1(int _);
augment class C1(int _);
augment class C1(int _);

class C2(final int _);
augment class C2(int _);
augment class C2(int _);
augment class C3(int _);

enum E(final int _) {
  e0(1);
}
augment enum E1(int _) {;}
augment enum E1(int _) {;}
augment enum E1(int _) {;}

main() {
  Expect.equals(1, C1(1)._);
  Expect.equals(2, C2(2)._);
  Expect.equals(1, E.e0._);
}
