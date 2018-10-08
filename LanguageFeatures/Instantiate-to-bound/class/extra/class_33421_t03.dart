/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When a type annotation [T] on the form qualified denotes a generic
 * class (so [T] is raw), instantiate to bound is used to provide the missing
 * type argument list. It is a compile-time error if the instantiate to bound
 * process fails.
 * @description Checks that compile error appears if several classes depends on
 * each other
 * @author iarkh@unipro.ru
 * @compile-error
 * @Issue 33421
 */

class A<X extends B> {}
class B<X extends A> {}

main() {}