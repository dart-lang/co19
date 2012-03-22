/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if s1 does not denote a URI that
 * contains the source code for a Dart library.
 * @description Checks that it is a compile-time error if an import tag's URI is an empty string.
 * @compile-error
 * @author vasya
 * @reviewer hlodvig
 * @reviewer msyabro
 */

#import("");

main() {
  try {
    var someVar = 0;
  } catch(var e) {}
}
