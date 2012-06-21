/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any of the optional arguments ai, 1 <= i <= n,
 * is not a compile-time constant. 
 * @description Checks that it is a compile-time error if the list provided as argument
 * to a show combinator includes a non-constant map literal.
 * @compile-error
 * @author rodionov
 * @needsreview issue 2508 - show combinator not implemented yet
 */

#import("2_Imports_lib.dart", show: [{"foo": "bar"}]);

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
