/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if e refers to the name v or the name v=.
 * @description Checks that a variable declaration statement final T e = e; causes a compile-time error.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  final int v = v;
}
