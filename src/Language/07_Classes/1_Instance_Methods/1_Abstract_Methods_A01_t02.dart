/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any default values are
 * specified in the signature of an abstract method.
 * @description Checks that a compile-time error is produced when some of the optional parameters 
 * specified in the abstract method signature have default values.
 * @compile-error
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class C {
  abstract m1([int i, String s, var j = 1, Object o = null, var v = null]);
}

main() {
  try {
    new C().m1(1, "");
  } catch(var ok){}
}

