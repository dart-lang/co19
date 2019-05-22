/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if the function type of k' is not a
 * subtype of the type of k.
 * @description Checks that a compile error is produced if factory constructor
 * redirects to a constructor whose type is not a subtype of factory
 * constructor function type. Checks the case when constructor parameter types
 * are not assignable.
 * @compile-error
 * @author ilya
 */

class F {
  factory F(x,[String y]) = C;
}

class C implements F {
  C(x,[int y]);
}

main() {
  new F(123);
}
