/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * @description Regression test for the issues 33599 (Analyzer produces
 * StackOverflow error in some cases when typedef references itself directly)
 * and 34700 (Analyzer does not reject typedef which has a reference to itself).
 * Checks that compile error appears if [typedef] references itself directly.
 * @author iarkh@unipro.ru
 */

typedef F1<X extends F1> = F1 Function();
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
