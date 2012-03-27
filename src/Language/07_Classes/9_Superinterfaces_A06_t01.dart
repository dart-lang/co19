/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Non-normative text: A class does not inherit members from its superinterfaces. 
 * However, its implicit interface does.
 * @description Checks that there's no static warning when members inherited from a superinterface
 * are accessed using a variable whose type is a class type implementing that superinterface and whose
 * value is null. NullPointerException is fully expected and caught. 
 * @author rodionov
 * @needsreview - static-warning is produced
 */

interface I {
  int foo;
  void bar();
}

class C implements I {}

main () {
  C c = null;
  
  try {
    c.foo = 1; // implicit setter
  } catch (NullPointerException e) {
  }
  
  try {
    int i = c.foo; // implicit getter
  } catch (NullPointerException e) {
  }
  
  try {
    c.bar(); // an explicit method
  } catch (NullPointerException e) {
  }
}
