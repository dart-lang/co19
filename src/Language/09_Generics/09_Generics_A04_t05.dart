/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type parameters of a generic G are in scope in the bounds of all of
 * the type parameters of G. The type parameters of a generic class or interface
 * declaration G are also in scope in the extends and implements clauses of G
 * (if these exist) and in the non-static members of G.
 * @description Checks that a type parameter is not in scope in a static context.
 * Using it as a type annotation of a static variable and triggering TypeError
 * by trying to assign a value to that variable.
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 */

#import("../../Utils/dynamic_check.dart");

class C<T> {
  static T t;
}

main() {
  checkTypeError(() {
    C.t = new Object();
  });
}
