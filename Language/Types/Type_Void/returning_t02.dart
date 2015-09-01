/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to return the result of a void method from
 * within a void method. One can also return null; or a value of type Dynamic.
 * Returning any other result will cause a type warning. In checked mode, 
 * a dynamic type error would arise if a non-null object was returned from 
 * a void method (since no object has runtime type dynamic).
 * @description Checks that returning null or a value with static type dynamic 
 * from within a void method does not result in a static type warning, but it's
 * a type error in the latter case.
 * @static-clean
 * @author rodionov
 * @reviewer iefremov
 */
import "../../../Utils/dynamic_check.dart";

void foo() {
  return null;
}

void bar(var v) {
  return v;
}

main() {
  foo();
  
  checkTypeError(() {
    bar(1);
  });
}
