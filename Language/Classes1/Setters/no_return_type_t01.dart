/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no return type is specified, the return type of the setter is
 * dynamic.
 * @description Checks that return type is indeed dynamic by calling arbitrary
 * method on the result of a setter and expecting no warnings.
 * @static-clean
 * @author iefremov
 */

class C {
  set foo(var x) {}
}

f(x) => ((new C()).foo = x).asdf();

main() {
  try {
    f(null);
  } catch (e) {}
}
