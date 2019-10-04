/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when await is used when the collection
 * literal is not inside an asynchronous function.
 *
 * @description Checks that it is a static error when await is used when the
 * collection literal is not inside an asynchronous function.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() {
  [await for (String i in Stream.fromIterable(["not", "int"])) i];
}
