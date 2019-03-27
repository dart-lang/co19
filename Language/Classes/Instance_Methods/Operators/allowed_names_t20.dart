/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The following names are allowed for user-defined operators: 
 * <, >, <=, >=, ==, -, +, /, ˜/, *, %, |, ˆ, &, <<, >>, >>>, []=, [], ˜.
 * @description Checks that operator is cannot be defined in a user class.
 * @compile-error
 * @author iefremov
 */

class C {
  operator is(x) {}
}

main() {
  try {
    var b = (new C());
    (b is dynamic);
  } catch (x) {}
}
