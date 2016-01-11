/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
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
 * metadata enum id ‘{’ id [‘, ’ id]* [‘, ’] ‘}’ and no errors occurs
 *
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

const String some_metadata = "Some metadata";

@some_metadata enum E {a, b, c}

main() {
  E e = E.a;
  Expect.equals(e, E.a);
}
