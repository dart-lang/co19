/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if b is true and a name in ImportNamespace has
 * already been added to the exported namespace of L by another import directive.
 * @description Checks that it's a compile-time error when a library imports (with different
 * prefixes) and re-exports two distinct libraries with different names that contain
 * an identically named declaration.
 * @compile-error
 * @author rodionov
 */

#import("2_Imports_A11_t01_lib1.dart", export: true, prefix: "lib1");
#import("2_Imports_A11_t01_lib2.dart", export: true, prefix: "lib2");

main() {
  try {
    var x;
  } catch(var e) {}
}
