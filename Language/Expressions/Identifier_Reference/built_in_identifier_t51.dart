/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a built-in identifier is used as
 * the declared name of a prefix, class, type parameter or type alias.
 * @description Checks that it is a compile-time error if a built-in identifier
 * "part" is used as the declared name of a type variable.
 * @compile-error
 * @author ngl@unipro.ru
 */

class A<part> {
  bool check(x) => x is part;
}

main() {
  new A().check(null);
}
