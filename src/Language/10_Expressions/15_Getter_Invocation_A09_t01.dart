/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ???
 * @description Checks that instance field cannot be read in static context.
 * @compile-error
 * @author kaigorodov
 */

class C {
  static var sf;
  var i_f;
}

main()  {
  var sf=C.sf;
  var i_f=C.i_f;
}
