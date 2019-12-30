/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the object being iterated over by a for-in loop
 * has a static type which is not dynamic, and is not a subtype of
 * Iterable<dynamic>
 *
 * @description Check that it is an error if the object being iterated over by a
 * for-in loop has a static type which is not dynamic, and is not a subtype of
 * Iterable<dynamic>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

void init() {}
main() {
  Object v1 = new Object();
  Object? v2 = new Object();
  void v3 = init();
  Null v4 = null;

  for (var o in v1) {}
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  for (var o in v2) {}
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  for (var o in v3) {}
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  for (var o in v4) {}
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}
