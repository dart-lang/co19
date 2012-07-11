/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is compile time error if an actual argument to the prefix 
 * combinator denotes a name that is declared by the importing library.
 * @description Checks that it is not an error when the prefix value duplicates
 * an imported name rather than local declaration.
 * @author rodionov
 * @needsreview issues 3340, 3481
 */

#import("2_Imports_A07_t05_lib1.dart");
#import("2_Imports_A07_t05_lib2.dart", prefix: "foo");

main() {
  try {
    foo.bar x; // foo is also a declaration in lib1
  } catch (var ok) {}
}
