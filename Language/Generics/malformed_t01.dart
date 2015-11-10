/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter is considered to be a malformed type when
 * referenced by a static member.
 * @description Checks that runtime error is thrown if type parameter is used
 * in a type test in static context.
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

class C<T> {
  static bool f() {
    return null is T; // static warning here: type variable in static context
  }
}

main() {
  Expect.throws(() => C.f());
}
