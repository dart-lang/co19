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
 * @description Checks that there is no error when the factory clause mentions a specific
 * type as the factory's class type parameter (both interface and its factory class are generics
 * with the same number of type parameters and the latter does not implement the former).
 * @author rodionov
 * @reviewer kaigorodov
 * @reviewer msyabro
 */

class F<String> {
  factory I() {}
}

interface I<String> default F<String>  {
  I();
}


main() {
  new I();
}
