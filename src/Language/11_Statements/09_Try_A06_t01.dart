/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an explicit type is associated with of p2, it is a static warning if that type
 * is not Object or Dynamic. 
 * @description Checks that there're no static warnings if the explicit type associated
 * with the second argument of a catch clause is either Object or Dynamic or there's no
 * type annotation at all.
 * @author rodionov
 * @reviewer kaigorodov
 */

class A {}

main() {
  try {
    throw new A();
  } catch(A ex, Object trace) {}
  
  try {
    throw new A();
  } catch(var ex, Dynamic trace) {}
  
  try {
    throw new A();
  } catch(final ex, Dynamic trace) {}
  
  try {
    throw new A();
  } catch(var ex, var trace) {}
  
  try {
    throw new A();
  } catch(final ex, var trace) {}

  try {
    throw new A();
  } catch(A ex, var trace) {}
  
  try {
    throw new A();
  } catch(var ex, final trace) {}
  
  try {
    throw new A();
  } catch(final ex, final trace) {}

  try {
    throw new A();
  } catch(A ex, final trace) {}
}
