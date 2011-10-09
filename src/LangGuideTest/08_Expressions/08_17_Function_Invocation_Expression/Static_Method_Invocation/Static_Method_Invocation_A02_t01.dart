/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a resolution error if the named class does not directly declare a static method
 * with the name id and a matching number of arguments.
 * @description Try to invoke not declared static function
 * @compile-error
 * @author msyabro
 * @reviewer akuznecov
 * @needsreview add test: same id but different signatures 
 */

class A {
}


void main() {
  A.func(1, 1);
}
