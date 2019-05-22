/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Types of members from super-bounded class types are computed using the same
 * rules as types of members from other types. Types of function applications
 * involving super-bounded types are computed using the same rules as types of
 * function applications involving other types. Here is an example:
 *   class A<X extends num> {
 *     X x;
 *    }
 *    A<Object> a;
 *    With this, [a.x] has static type Object, even though the upper bound on
 *    the type variable X is num.
 * @description Checks that example from the Spec works correctly.
 * @Issue 36959
 * @author iarkh@unipro.ru
 */

class A<X extends num> {
  X x;
}

A a1;
A<dynamic> a2;
A<Object> a3;
A<void> a4;

main() {}
