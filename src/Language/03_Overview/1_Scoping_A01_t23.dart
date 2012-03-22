/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart is lexically scoped and uses a single namespace for variables, functions and types.
 * It is a compile-time error if there is more than one entity, other than a setter and a getter,
 * with the same name declared in the same scope.
 * @description Checks that it is a compile-time error if an interface contains
 * two variables with the same name.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

interface I {
  static final conflictingName = 1;
  static final conflictingName = "";
}

class C implements I {}

main() {
  try {
    var c = new C();
    c.conflictingName;
  } catch(var e) {}
}