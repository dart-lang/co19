/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An enumerated type, or enum, is used to represent a fixed number 
 * of constant values.
 *  enumType:
 *  metadata enum id ‘{’ id [‘, ’ id]* [‘, ’] ‘}’
 *  ;
 * @description Checks that enum can be created using syntax
 * metadata enum id ‘{’ id [‘, ’ id]* [‘, ’] ‘}’ and no errors occurs. Test type
 * alias
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../Utils/expect.dart";

const String some_metadata = "Some metadata";

@some_metadata enum E {a, b, c}

typedef EAlias = E;

main() {
  E e1 = EAlias.a;
  EAlias e2 = E.a;
  EAlias e3 = EAlias.a;
  Expect.equals(e1, E.a);
  Expect.equals(e2, E.a);
  Expect.equals(e3, E.a);
}
