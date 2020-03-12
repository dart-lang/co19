/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
library legacy_library_aliases_lib;

class A {
  void bar() {}
  int operator[](int index) => index;
}

typedef AAlias = A;
typedef IntAlias = int;
typedef StringAlias = String;
