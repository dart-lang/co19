/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any of the elements of the first argument 
 * of a use of a show or hide combinator does not denote a valid identifier. 
 * @description Checks that it is a compile-time error if the list provided as argument
 * to a hide combinator includes a constant constructor invocation.
 * @compile-error
 * @author rodionov
 * @needsreview issue 2508 - show combinator not implemented yet
 */

#import("2_Imports_lib.dart", hide: ["foo", const C()]);

class C {
  const C();
}

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
