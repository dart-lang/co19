/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All classes and interfaces are defined in the library scope and must have
 * unique names within the library scope.
 * @description Checks that a class and an interface with the same name can not be declared
 * in one scope.
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */
 
class A {}
interface A {}


void main() {}
