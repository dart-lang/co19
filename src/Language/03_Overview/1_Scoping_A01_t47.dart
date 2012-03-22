/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart is lexically scoped and uses a single namespace for variables, functions and types.
 * It is a compile-time error if there is more than one entity, other than a setter and a getter,
 * with the same name declared in the same scope.
 * @description Checks that it is a compile-time error if a prefix of an imported library
 * and a class share the same name.
 * @compile-error
 * @author iefremov
 * @needsreview Issue 2244 (not documented?)
 */

#import("lib.dart", prefix:"pr");

class pr {}

main() {
  try {
    new pr();
  } catch(var x){}
}