/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * These are subject to the same compile-time and static checking rules 
 * as getters and setters in classes.
 * 7.3: It is a static warning if a class has a setter with argument type T
 * and a getter of the same name with return type S, and T may not be assigned to S.
 * @description Checks that it is a static warning if an interface declares a getter
 * and a setter with the same name but not mutually assignable return/parameter types.
 * @author rodionov
 * @reviewer kaigorodov
 * @static-warning
 */

interface i  {
  int get m();
  void set m(double foo);
}

main() {}
