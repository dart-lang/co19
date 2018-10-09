/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for issue 33421 (Dart does not throw error when
 * type parameter is a supertype of its upper bound): checks that two class type
 * parameters cannot extend each other.
 * @compile-error
 * @author iarkh@unipro.ru
 */
class A<X extends X1, X1 extends X> {}

main() {}
