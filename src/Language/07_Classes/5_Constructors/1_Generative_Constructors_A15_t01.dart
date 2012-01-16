/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A formal constructor parameter is either a formal parameter (6.2)
 * or an initializing formal. An initializing formal has the form this.id, 
 * where id is the name of an instance variable of the immediately enclosing class. 
 * It is a compile-time error if an initializing formal is used by function other 
 * than a generative constructor.
 * @description Checks that it is a compile-time error when the initializing formal
 * syntax is used by a factory constructor.
 * @compile-error
 * @author rodionov
 */

interface I default C {
  I(int x);
}

class C {
  int x;
  factory I(this.x) {}
}

main() {
  try {
    new I(null);
  } catch(var v) {}
}
