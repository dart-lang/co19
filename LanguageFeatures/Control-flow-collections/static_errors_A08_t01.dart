/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the stream type of the iterator in an
 * asynchronous await for-in element may not be assigned to the for-in
 * variable's type
 *
 * @description Checks that it is a static error when the stream type of the
 * iterator in an asynchronous await for-in element may not be assigned to the
 * for-in variable's type
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() async {
  [await for (int i in Stream.fromIterable(["not", "int"])) i];
}
