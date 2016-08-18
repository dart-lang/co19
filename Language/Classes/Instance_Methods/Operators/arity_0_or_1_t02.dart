/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile-time error if the arity of the user-declared
 * operator - is not 0 or 1.
 * The - operator is unique in that two overloaded versions are permitted.
 * If the operator has no arguments, it denotes unary minus.
 * If it as an argument, it denotes binary subtraction.
 * @description Checks that a compile-time error is produced if a user-defined
 * operator - specifies two parameters.
 * @compile-error
 * @author kaigorodov
 */

class C {
  operator -(var val, var val2) {}
}

main() {
  try {
    bool b = (new C() - new C());
  } catch (ex) {}
}
