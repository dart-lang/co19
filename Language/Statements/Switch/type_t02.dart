/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the type of e is may not be assigned to
 * the type of ek.
 * @description Checks that a compile error is produced if the type of the
 * switch expression's value cannot be assigned to any of the case expression
 * types. Test the case when there is a default clause
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() {
  switch (false) {
    case 0: break;
    default:
  }
}
