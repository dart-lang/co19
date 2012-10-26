/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of e may not be assigned 
 * to either bool or () -> bool.
 * @description Checks that there is no static type warning if the type of e is Dynamic
 * or bottom.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  try {
    var foo = 0;
    assert(foo);
  } on TypeError catch(e) {}
  
  try {
    assert(null);
  } on TypeError catch(ok) {}
}
