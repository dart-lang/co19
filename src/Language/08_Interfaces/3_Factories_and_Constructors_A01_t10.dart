/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interfaceDefinition:
 * interface identifier typeParameters? superinterfaces? factorySpecification? '{'
 *   (interfaceMemberDefinition)* '}'
 * ; 
 * factorySpecification:
 *   default qualified typeParameters?
 * ;
 * @description Checks that the factory clause can have a type parameter with bounds
 * (the interface has the same type parameter but without bound).
 * @author rodionov
 * @reviewer kaigorodov
 * @reviewer msyabro
 */

class F<T extends String> {
  factory I() {}
}

interface I<T> default F<T extends String>  {
  I();
}


main() {
  new I();
}
