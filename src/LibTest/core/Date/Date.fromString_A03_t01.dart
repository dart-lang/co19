/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromString(String formattedString) is not a const constructor
 * @description Checks that Date.fromString constructor cannot be [:const:] 
 * @compile-error
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Date d = const Date.fromString("2001-01-01 00:00:00.000");
}
  