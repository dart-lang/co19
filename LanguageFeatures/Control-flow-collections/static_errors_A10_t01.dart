/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when await is used before a C-style for
 * element. await can only be used with for-in loops.
 *
 * @description Checks that it is a static error when await is used before a
 * C-style for element.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() async {
  [await for (int i = 0; i < 10; i++) i];
}
