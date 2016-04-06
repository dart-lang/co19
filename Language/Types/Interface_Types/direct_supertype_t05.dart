/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The implicit interface of class I is a direct supertype of the
 * implicit interface of class J iff:
 * • If I is Object, and J has no extends clause
 * • If I is listed in the extends clause of J.
 * • If I is listed in the implements clause of J
 * • If I is listed in the with clause of J
 * • If J is a mixin application of the mixin of I.
 * @description Checks that a mixin aplication of the mixin of I is its
 * supertype.
 * @author ngl@unipro.ru
 */
import "../../../Utils/expect.dart";

class I {}
class M {}
class J = I with M;

main() {
  Expect.isTrue(new J() is I);
}
