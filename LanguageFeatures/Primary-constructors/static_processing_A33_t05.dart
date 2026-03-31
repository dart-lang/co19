// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a mixin class declaration has a
/// primary constructor which is not trivial, that is, it declares one or more
/// parameters, or it has a body part that has an initializer list or a body.
///
/// @description Check that it is not an error if a mixin class declaration has
/// a trivial primary constructor which has an empty body part.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

mixin class M1();

mixin class const M2();

mixin class M3() {
  final int id = 0;
  this;
}

class C1 = Object with M1;
class C2 = Object with M2;
class C3 = Object with M3;

main() {
  var m1 = M1();
  var m2 = const M2();
  Expect.equals(0, M3().id);
  var c1 = C1();
  var c2 = C2();
  Expect.equals(0, C3().id);
}
