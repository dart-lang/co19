/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if a generic type is not provided the correct number of type arguments.
 * @description Checks that warning is produced if the number of arguments is less than needed.
 * @author iefremov
 * @static-type-error
 * @needsreview This warning (or, possibly, a compile error) exists, but the assertion was removed from the latest spec.
 */

class A<T, S> {
  A() {}
}

main() {
  A<int> a;
}



