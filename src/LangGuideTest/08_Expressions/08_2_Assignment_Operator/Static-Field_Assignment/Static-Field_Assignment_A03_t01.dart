/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a resolution error if C does not declare a static setter named identifier 
 * (a non-final static field implicitly declares a setter).
 * @description Try to assign value to non-static member
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  var x;
}


main() {
  A.x = 1;
}
