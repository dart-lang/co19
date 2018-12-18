/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33626 (Dart does not throw error
 * when analyzer fails with "type_argument_not_matching_bounds" error for
 * functions)
 * @compile-error
 * @author iarkh@unipro.ru
 */

class A {}
typedef F<X extends A> = X Function();

class B {}
B tryme() {}

main() {
  F<B> f = tryme;
}