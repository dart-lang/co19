/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type alias declares a name for a type expression.
 * <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
 * ‘;’
 * | <metadata> typedef <functionTypeAlias>
 *  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
 *  <functionPrefix> ::= <type>? <identifier>
 * @description Checks that identifier must be present.
 * @compile-error
 * @author iefremov
 */

typedef <T>();

main() {
  try {
  } catch (x) {}
}
