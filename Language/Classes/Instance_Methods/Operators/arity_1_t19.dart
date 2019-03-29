/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the arity of a user-declared 
 * operator with one of the names:
 * <, >, <=, >=, ==, -, +,  ̃/, /, *, %, |, ˆ, &, <<, >>, >>>, [] is not 1.
 * @description Checks that a compile-time error is produced if a user-defined
 * operator >>> specifies two parameters.
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

class C {
  operator >>>(var val, var val2) {}
}

main() {
  try {
    bool b = (new C() >>> new C());
  } catch (ex) {}
}

