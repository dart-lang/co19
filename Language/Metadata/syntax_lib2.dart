/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library syntax_lib2;

class C {
  const C();
}

class D<T> {
  const D();
  const D.d(T t);
}

class Bar {
  const Bar(int x, int y);
}

const Y = 'Yes';

enum F {x,y,z}
