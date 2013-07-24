/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter is considered to be a malformed type when referenced by a static member.
 * @description Checks that it is a runtime error (type error specifically in checked mode) 
 * to reference a type parameter from static context (in a type test expression) and there's no static warning.
 * @author iefremov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";
import "../../Utils/dynamic_check.dart";

class C<T> {
  static f() {
    null is T; // static (not type) warning here: type variable in static context
  }
}

main() {
  try {
    C.f();
    Expect.fail("Runtime error expected");
  } on Error catch(e) {
    Expect.isTrue(!isCheckedMode() || e is TypeError, "Type error expected in checked mode.");
  }
}
