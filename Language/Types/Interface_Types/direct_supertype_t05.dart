// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The implicit interface of class I is a direct supertype of the
/// implicit interface of class J iff:
/// • If I is Object, and J has no extends clause
/// • If I is listed in the extends clause of J.
/// • If I is listed in the implements clause of J
/// • If I is listed in the with clause of J
/// • If J is a mixin application of the mixin of I.
/// @description Checks that a mixin aplication of the mixin of I is its
/// supertype.
/// @author ngl@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import "../../../Utils/expect.dart";

class I {}
class M {}
class J = I with M;

main() {
  Expect.isTrue(new J() is I);
  Expect.runtimeIsType<I>(new J());
}
