/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a resolution error if C does not resolve to a class.
 * @description C does not resolve a class
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */


void main() {
  A.x = 1;
}
