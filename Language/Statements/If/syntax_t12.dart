/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The if statement allows for conditional execution of statements.
 * ifStatement:
 *   if '(' expression ')' statement ( else statement)?
 * ;
 * @description Checks that nested if-else statements are allowed and work
 * correctly with single if nested into the single if.
 * @author hlodvig
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  var x = 0;

  if (true)
    if (false) x = 1;

  Expect.equals(0, x);

  if (true)
    if (true) ;

  Expect.equals(0, x);

  if (false)
    if (true) x = 1;

  Expect.equals(0, x);

  if (false)
    if (false) x = 1;

  Expect.equals(0, x);
}

