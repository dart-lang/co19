/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration is a function that is not a method, getter, setter or function literal. 
 * Function declarations include library functions, which are function declarations at the top level of a library, 
 * and local functions, which are function declarations declared inside other functions.
 * It is a compile-time error to preface a function declaration with the built-in identifier static.
 * @description Checks that it is a compile-time error to preface library function with 'static'.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

static void f() {}

main() {
  try {
    f();
  } catch(x){}
}
