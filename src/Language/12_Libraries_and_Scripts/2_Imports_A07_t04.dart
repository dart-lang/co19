/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is compile time error if an actual argument to the prefix 
 * combinator denotes a name that is declared by the importing library.
 * @description Checks that it is a compile-time error if prefix value duplicates
 * a function type alias name.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

#import("2_Imports_lib.dart", prefix: "prefix");

typedef prefix(int);

main() {
  try {
    prefix x;
  } catch (var ok) {}
}
