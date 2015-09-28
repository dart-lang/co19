/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library variable is implicitly static. It is a compile-time 
 * error to preface a top level variable declaration with the built-in 
 * identifier static.
 * @description Checks that a compile-time error occurs if a top level 
 * variable declaration is prefaced with the built-in identifier static.
 * @compile-error
 * @author vasya
 * @reviewer kaigorodov
 */

import "library_variable_t01_lib.dart";

main() {
  try {
    foo = 1;
  } catch (ok) {}
}
