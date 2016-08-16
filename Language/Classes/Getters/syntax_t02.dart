/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * getterSignature:
 *   returnType? get identifier
 * ;
 * @description Checks that it is a compile-time error if the getter identifier
 * is missing.
 * @author iefremov
 * @compile-error
 */

class C {
  get => null;
}

main() {
  try {
    new C();
  } catch (e) {}
}

