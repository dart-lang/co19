/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to refer to a type parameter from within a static member.
 * @description Checks that it is a dynamic type error in checked mode when a type
 * parameter is used as type annotation and assigned a non-null value in static context 
 * and no error at all in production mode.
 * Also checks that no error at all occurs when it's assigned a null value.
 * @static-warning unknown type used in type annotation
 * @author iefremov
 * @needsreview Assertion obsolete, update once spec v0.12 is out (see issue 5230)
 */
import "../../Utils/dynamic_check.dart";

class C<T> {
  static T t;
}

main() {
  checkTypeError(() {
    C.t = new Object();
  });

  C.t = null;
}
