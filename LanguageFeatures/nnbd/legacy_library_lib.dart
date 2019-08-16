/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// @dart=2.5
// SharedOptions=--enable-experiment=non-nullable
library legacy_library_lib;

class A {
}

class C<X extends A> {
  X x;
  C(this.x);
}
