/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter is considered to be a malformed type when referenced
 * by a static member.
 * @description Checks that it if a type parameter is used as type annotation
 * in static context, it is static warning and dynamic error in checked mode
 * to assign to such member (since type test will be run for malformed type).
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 */
import "../../Utils/dynamic_check.dart";

class C<T> {
  static T t; // static (not type) warning here: type variable in static context
}

main() {
  checkTypeError(() => C.t = new Object());
}
