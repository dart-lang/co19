/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the type of the stream expression in an
 * asynchronous await for-in element may not be assigned to Stream<T> for some
 * type T
 *
 * @description Checks that it is a static error when the type of the stream
 * expression in an asynchronous await for-in element may not be assigned to
 * Stream<T> for some type T
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() async {
  [await for (var i in "not stream") i];
}
