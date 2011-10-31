/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let p = G < A1, . . . , An > be a parameterized type. It is a compile-time error if G is not
 * an accessible generic type declaration with n type parameters.
 * @description Checks that error is produced if G has less type parameters than needed.
 * @author iefremov
 * @compile-error
 */

class A<T, U> {}

main() {
  A<int> a = null;
}

