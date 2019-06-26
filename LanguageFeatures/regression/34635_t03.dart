/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 34635 (Analyzer checks "class
 * [C<X extends C>]" class declaration in a very strange way): check that
 * declaring [class A<X extends A> {}] after [class A<X extends C>] causes
 * compile error.
 * @compile-error
 * @author iarkh@unipro.ru
 */
class A<X extends B> {}
class B<X extends C> {}
class C<X extends A<B>> {}

main() {}
