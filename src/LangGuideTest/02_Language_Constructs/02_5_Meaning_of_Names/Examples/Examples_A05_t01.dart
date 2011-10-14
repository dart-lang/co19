/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable or field initializer cannot refer to itself.
 * @description Checks that a variable that refers to itself is not valid.
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */


main() {
  int x = x;
}
