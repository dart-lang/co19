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

class C {
}

main() {
  C? c = C();
  List<C?> list = [C(), null, C()];
  for (var o in new Object()) {}                //# 01: compile-time error
  for (C? cc in list) {}                        //# 02: compile-time error
  for (var o in [Object(), Object(), null]) {}  //# 03: compile-time error
  for (var o in [Object(), C(), c]) {}          //# 04: compile-time error
}
