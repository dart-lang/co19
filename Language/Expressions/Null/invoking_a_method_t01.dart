/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking a method on null yields a NoSuchMethodError unless the
 * method is explicitly implemented by class Null.
 * @description Checks that invoking a method on null does not yield a
 * NullPointerException if class Null implements it.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {}

main() {
  A a = null;
  var x = a.toString();
}
