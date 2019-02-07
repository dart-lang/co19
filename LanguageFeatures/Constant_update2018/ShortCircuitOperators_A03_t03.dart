/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that compile-time exception is thrown if the first
 * operand of [??] operator is [null] and the second one is incorrect in the
 * constant expression.
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018

main() {
  const String s1 = null ?? (null as String).length; //# 01: compile-time error
  const String s2 = null ?? 124;                     //# 02: compile-time error
}
