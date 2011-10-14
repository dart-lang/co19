/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function overrides a function in a superclass if the function in the superclass has the same name.
 * @description Checks that a class can have a function with the same name as the
 * one in the superclass.
 * @author msyabro
 * @reviewer pagolubev
 */
 
class A {
  void func() {}
}
 
class B extends A {
  void func() {}
}


main() {}
