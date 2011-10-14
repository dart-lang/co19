/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String interpolation allows to insert identifiers (and not any expression)
 * with a prefixed $ or quoting the identifier by ${}. Every '$' in a non-raw string must
 * either be escaped (prefixed with a \), or must be followed by a non-dollar-containing
 * identifier, or an open curly brace.
 * @description Checks that $ or ${} in a non-raw string will be replaced by a quoted
 * variable's value.
 * @author pagolubev
 * @reviewer iefremov
 */


main() {
  var a = 1;
  var b = 2;
  var a$b = 3;
  Expect.isTrue("$a$b" == "12");
  Expect.isTrue("${a$b}" == "3");

  var $ = 3;
  Expect.isTrue("${$}" == "3");

  //var arr = [1, 3];
  //Expect.equals("$arr.length", "[1, 3].length");
}
