/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter T may be suffixed with an extends clause that
 * specifies the upper bound for T. If no extends clause is present, the upper
 * bound is Object.
 * @description Checks that no static warnings or compile-time errors are
 * produced when making various instances of generic class which type parameter
 * lacks extends clause.
 * @static-clean
 * @author iefremov
 */

class G<T> {}
typedef f();

main() {
  new G<int>();
  new G<num>();
  new G<Function>();
  new G<Object>();
  new G<dynamic>();
  new G<f>();
  new G<G>();
}
