/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A block statement introduces a new scope, which is nested in the
 * lexically enclosing scope in which the block statement appears.
 * @description Checks expected nest of lexical scopes.
 * @author ilya
 */
import '../../../Utils/expect.dart';

main() {
  var x=1;
  {
    var x=2;
    {
      var x=3;
      {
        Expect.equals(3, x);
      }
      Expect.equals(3, x);
    }
    Expect.equals(2, x);
  }
  Expect.equals(1, x);
}

