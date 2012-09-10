/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A factory is a constructor prefaced by the built-in identifier factory.
 * factoryConstructorSignature:
 *   factory qualified ('.' identifier)? formalParameterList
 * ;
 * @description Checks that it is a compile-time error if the factory constructor declaration
 * is missing the name.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 */

class C {
  factory () {}
}

main() {
  try {
    new C();
  } catch (x){}
}
