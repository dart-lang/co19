/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that operator [??] operators does not reject the second
 * operand if the first one is [null] in constant expression. Exception is
 * thrown if the second argument is of incorrect type.
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018
main() {
  const String s1 = null ?? (null as String).length; // #01: compile-time error
  const String s2 = null ?? 124;                     // #02: compile-time error
}
