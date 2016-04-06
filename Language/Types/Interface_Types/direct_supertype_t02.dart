/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that a type listed in the extends clause of another
 * class is its supertype.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview It's currently impossible to check whether a type is a direct
 * supertype of another without some sort of reflection framework.
 */
import "../../../Utils/expect.dart";

class I {}

class J extends I {}

main() {
  Expect.isTrue(new J() is I);
}
