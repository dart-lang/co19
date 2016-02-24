/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile-time error to reference a local function
 * before its declaration.
 * @description Checks that it is a compile-error to declare mutually recursive
 * functions, because the first one uses the second before declaration.
 * @compile-error
 * @author ilya
 */

main() {
  evenHandler(x) => x.isEven ? 1 : oddHandler(x);
  oddHandler(x) => x.isOdd ? 1 : evenHandler(x);

  try {
    evenHandler(1);
  } catch (_) {}
}
