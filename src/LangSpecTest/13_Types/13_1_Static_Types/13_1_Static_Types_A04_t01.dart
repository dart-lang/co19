/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if any of generic type arguments are not subtypes of the
 * bounds of the corresponding formal type parameters.
 * @description Checks that a warning is produced when using int as a generic type argument in place of String.
 * @author iefremov
 * @reviewer rodionov
 * @static-type-error
 * @needsreview This warning (or, possibly, a compile error) exists, but the assertion was removed from the latest spec.
 */

class A<T extends String> {
}

main() {
  A<int> a;
}

