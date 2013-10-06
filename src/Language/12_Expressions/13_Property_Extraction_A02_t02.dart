/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise e.m is treated as a getter invocation.
 * @description Checks that if type of e has no method nor getter named m,
 * e.m throws NoSuchMethodError.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class C {}

main() {
  Expect.throws(() {
    new C().qwe; // static warning
  }, (e) => e is NoSuchMethodError);
}

