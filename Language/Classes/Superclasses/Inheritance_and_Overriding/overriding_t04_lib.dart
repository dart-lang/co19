/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library overriding_t04_lib;

class S {
  _foo(var arg) { return 'A'; }
  _bar([x]) {return "barx";}
  get _g {return "super-g";}
}
