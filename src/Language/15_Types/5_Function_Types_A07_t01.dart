/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a concrete class implements Function
 * and does not have a concrete method named call.
 * @description Checks that it is a static warning if concrete class
 * implements Function and has no method named call.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class C implements Function {}

main() {
  new C();
}
