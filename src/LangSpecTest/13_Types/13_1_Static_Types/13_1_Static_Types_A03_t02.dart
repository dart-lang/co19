/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if a generic type is not provided the correct number of type arguments.
 * @description Checks that a warning is produced if the number of arguments is greater than required.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 * @needsreview This actually produces a compile error, even though the assertion was removed from spec.
 */

class A<T, S> {
}

main() {
  A<int, int, int> a;
}
