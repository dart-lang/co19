/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An on-catch clause of the form on T catch (p1, p2) s introduces
 * a new scope CS in which final local variables specified by p1 and p2 are
 * defined. The statement s is enclosed within CS. The static type of p1 is T
 * and the static type of p2 is StackTrace.
 *
 * @description Checks that local variables p1 and p2 are final
 * @author sgrekhov@unipro.ru
 * @41460
 */
main() {
  try {
    throw "foo";
  } on String catch (p1, p2) {
    p1 = "";
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    p2 = new StackTrace.fromString("");
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
