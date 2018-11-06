/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the Issue 33833 (Analyzer throws compile
 * error when declare a class with typed parameter which depends on
 * parameterized typedef): Checks that for [typedef G<X extends A<X>> = X
 * Function()] attempt to declare [class B<X extends A<G<X>>>] causes compile
 * error
 * @compile-error
 * @author iarkh@unipro.ru
 */

class A<X> {}
typedef G<X extends A<X>> = X Function();
class B<X extends A<G<X>>> {}

main() {
}