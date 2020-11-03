/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the iterable type of the iterator in a
 * synchronous for-in element may not be assigned to the for-in variable's type.
 *
 * @description Checks that it is a static error when the iterable type of the
 * iterator in a synchronous for-in element may not be assigned to the for-in
 * variable's type.
 * @author sgrekhov@unipro.ru
 */

main() {
  [for (int i in ["not", "int"]) i];
// [error line 17, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  [for (int i in [3.14, 1.0]) i];
// [error line 21, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
