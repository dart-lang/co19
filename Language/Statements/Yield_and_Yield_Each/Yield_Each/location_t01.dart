/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a yield-each statement appears in
 * a function that is not a generator function.
 *
 * @description Check that it is compile error if yield-each statement appears
 * inside synchronous function.
 *
 * @issue #25495
 * @compile-error
 * @author a.semenov@unipro.ru
 */

main() {
  yield* [1];
}
