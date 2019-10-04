/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant expression is an expression whose value can never
 * change, and that can be evaluated entirely at compile time.
 * A constant expression is one of the following:
 * . . .
 * An expression of one of the forms [e1 ˜/ e2], [e1 >> e2], [e1 >>> e2], or
 * [e1 << e2] is potentially constant if [e1] and [e2] are both potentially
 * constant expressions.
 * It is further constant if both [e1] and [e2] are constant expressions that
 * both evaluate to an instance of [int]
 * @description Checks that it is a compile-time error when an expression of
 * the form [e1 >>> e2] where [e1] or [e2] does not evaluate to an integer
 * value, is used to initialize a constant variable.
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

final constList = const [
  1 >>> "one and a half"
];

main() {
}
