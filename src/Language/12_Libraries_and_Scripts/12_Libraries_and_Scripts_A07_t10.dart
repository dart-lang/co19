/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Libraries may include extralinguistic resources (e.g., audio,
 * video or graphics files)
 * resource:
 * `#' `resource' `(' stringLiteral `)' `;'
 * ;.
 * @description Checks that it is a compile-time error if the string literal
 * in a resource directive is enclosed in square brackets instead of parentheses.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#resource['favicon.ico'];

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
