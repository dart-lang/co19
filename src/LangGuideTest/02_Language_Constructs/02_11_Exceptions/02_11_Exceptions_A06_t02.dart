// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion The syntax for catch parameters is similar to the syntax of function arguments.
 * @description Checks that a catch clause must specify type, var or final.
 * @author iefremov
 * @compile-error
 * @reviewer pagolubev
 */


main() {
  try {}
  catch(e) {}
}
