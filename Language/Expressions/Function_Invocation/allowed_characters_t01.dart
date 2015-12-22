/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Space, tab and line terminators characters are allowed between
 * tokens.
 * @description Checks that different whitespace characters and line terminators
 * are allowed in function invocation expressions.
 * @author hlodvig
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

var x;

void f() {
  x = 1;
}

main() {
  x = 0;
  f ( );
  Expect.equals(1, x);

  x = 0;
  f	(	)	;
  Expect.equals(1, x);

  x = 0;
  f
  (
  )
  ;
  Expect.equals(1, x);
}
