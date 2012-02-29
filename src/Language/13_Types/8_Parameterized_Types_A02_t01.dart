/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if Ai,  i in [1..n] does not denote
 * a type in the enclosing lexical scope.
 * @description Checks that a static type warning is produced if a type parameter of G does
 * not denote an accessible type.
 * @author rodionov
 * @reviewer iefremov
 * @static-warning
 */

#import("../../Utils/dynamic_check.dart");

main() {
  checkTypeError(() {
    List<UnknownType> a = null;
  });
}

