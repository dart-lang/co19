/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error warning if any of the type arguments to k'
 * are not subtypes of the bounds of the corresponding formal type parameters
 * of type.
 * @description Checks that a compile error is produced if factory constructor
 * type parameters are not subtypes of bounds of corresponding type parameters
 * of redirected class constructor.
 * @compile-error
 * @author ilya
 */

class F <T extends String> {
  factory F([T x]) = C;
}

class C <T extends num> implements F<T> {
  C([T x]);
}

main() {
  new F<String>();
}
