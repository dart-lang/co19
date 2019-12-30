/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A new primitive type Never. This type is denoted by the built-in
 * type declaration Never declared in dart:core.
 *
 * @description Check new primitive type Never
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
Never fail() {
  throw new Exception();
}

main() {
  try {
    fail();
  } on Exception catch(_) {}
}
