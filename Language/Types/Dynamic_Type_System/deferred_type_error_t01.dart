/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A Dart implementation must support execution in both production
 * mode and checked mode. Those dynamic checks specified as occurring
 * specifically in checked mode must be performed iff the code is executed in
 * checked mode.
 * In checked mode, it is a dynamic type error if a deferred, malformed or
 * malbounded type is used in a subtype test.
 * @description Checks that a dynamic type error occurs (in checked mode and in
 * product mode) when deferred type is used in a subtype test (explicit and
 * implicit).
 * @static-warning
 * @author ngl@unipro.ru
 */

import "../somelib1.dart" deferred as p;

class A {}

main() {
  try {
    A is p.C;     /// static type warning
  } on TypeError catch (e) {}
  try {
  A a = new p.C();      /// static type warning
  } on TypeError catch (e) {}
}
