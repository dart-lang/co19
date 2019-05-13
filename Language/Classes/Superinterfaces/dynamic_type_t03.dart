/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the implements clause of a class C
 * specifies type dynamic as a superinterface.
 * @description Checks that it is a compile-time error if dynamic is included
 * in the type list of a class's implements clause.
 * @author sgrekhov@unipro.ru
 * @compile-error
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

typedef d = dynamic;

class A implements d {}

main() {
  new A();
}
