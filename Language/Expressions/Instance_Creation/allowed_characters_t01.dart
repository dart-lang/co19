/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Space, tab and line terminators characters are allowed between
 * tokens.
 * @description Checks that different whitespace characters and line terminators
 * are allowed in instance creation expressions.
 * @author hlodvig
 * @reviewer kaigorodov
 */

class A {
}

main() {
  var a1 = new A( );
  var	a2	=	new	A	(	);
  var
  a3
  =
  new
  A
  (
  );
}
