/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to use a built-in identifier other than Dynamic 
 * as a type annotation.
 * @description Checks that it is a compile-time error when a built-in identifier
 * "equals" is used as a type annotation of a local variable.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 * @note http://code.google.com/p/dart/issues/detail?id=2492, issue 3307
 */

main() {
  try {
    equals foo;
  } catch(var x) {}
}
