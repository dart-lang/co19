/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Space, tab and line terminators characters are allowed between tokens.
 * @description Checks that different whitespace characters and line terminators are allowed for
 *  variable declarations.
 * @author hlodvig
 * @reviewer kaigorodov
 */

main() {
  var v1 = 1;
  var	v2	=	1;
  var
  v3
  =
  1;

  int i1 = 1;
  int	i2	=	1;
  int
  i3
  =
  1;
}

