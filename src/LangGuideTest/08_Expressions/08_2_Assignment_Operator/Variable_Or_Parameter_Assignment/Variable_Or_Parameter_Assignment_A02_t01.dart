/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a resolution error if the variable or parameter in variable or parameter assignment is final.
 * @description Check assignment to final variable
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */


main() {
  final c;
  c = 1;
}
