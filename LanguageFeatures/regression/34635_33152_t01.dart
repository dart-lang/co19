/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issues:
 * 33152 ([class C<X extends C> {}] causes dart crash instead of compiler error)
 * 34635 (Analyzer checks [class C<X extends C>] declaration in a very strange
 * way)
 * Check test case from the bug description, i.e. that declaring [class A<X
 * extends A> {}] causes compile error.
 * @compile-error
 * @author iarkh@unipro.ru
 */
class A<X extends A> {}

main() {
}
