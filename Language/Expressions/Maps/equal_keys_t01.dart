/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iff all the keys in a map literal are compile-time constants, it
 * is a static warning if the values of any two keys in a map literal are equal.
 * @description Checks that it is a static warning if the values of any two
 * keys in a map literal are equal.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  <String, int>{
    "key1": 1,
    "key1": 2  /// static type warning
  };
}
