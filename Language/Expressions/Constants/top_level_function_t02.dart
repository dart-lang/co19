/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple or qualified identifier denoting a top-level function
 * is a constant expression.
 * @description Checks that a function literal cannot be assigned to a constant variable.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

const a = () => null;

main() {
  try {
    print(a);
  } catch(x) {}
}
