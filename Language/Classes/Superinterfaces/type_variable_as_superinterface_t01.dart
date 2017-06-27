/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the implements clause of a class
 * C species a type variable as a superinterface.
 * @description Checks that it is a compile-time error when the type expression
 * in a class's implements clause denotes a type variable.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 * @note renamed from 10_Superinterfaces_A02_t04.dart
 */

class A<T> implements T {}

main() {
  A a = new A();
}
