/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the type of the condition expression
 * (the second clause) in a C-style for element may not be assigned to bool
 *
 * @description Checks that it is a static error when the type of the condition
 * expression (the second clause) in a C-style for element may not be assigned
 * to bool
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() {
  [for (; "not bool";) 1];
}
