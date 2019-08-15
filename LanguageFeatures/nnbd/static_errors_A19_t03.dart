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
 * Iterable<dynamic>. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

class C {
}

typedef CAlias = C?;

main() {
  CAlias c = CAlias();
  List<CAlias> list = [C(), null, CAlias()];
  for (var o in new Object()) {}
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  for (CAlias cc in list) {}
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  for (var o in [Object(), Object(), null]) {}
//               ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  for (var o in [Object(), C(), c]) {}
//               ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
