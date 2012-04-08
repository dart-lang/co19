/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a hidden prefix name can't be used as a prefix.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

#import("lib.dart", prefix:"prefix");

main() {
  var prefix = 1;
  try {
    prefix.accessibleVariable; //'prefix' can't be used as a library prefix in this scope.
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}
}