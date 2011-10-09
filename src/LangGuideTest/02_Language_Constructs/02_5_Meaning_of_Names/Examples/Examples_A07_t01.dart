/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Regardless where a name is declared, it is conceptually defined at the
 * beginning of its innermost enclosing scope.
 * @description Variable shadows another variable that is declared below.
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */


main {
  {
    var i = 0;
  }
  var i = 1;
}
