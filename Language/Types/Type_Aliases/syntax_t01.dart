// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias declares a name for a type expression.
/// <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
/// ‘;’
/// | <metadata> typedef <functionTypeAlias>
///  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
///  <functionPrefix> ::= <type>? <identifier>
/// @description Checks that type alias syntax works as expected. Test
/// non-function type alias with no type parameters
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

const int meta = 1;

class C {
}

@meta typedef CAlias = C;

main() {
  CAlias ca = new CAlias();
  Expect.isTrue(ca is C);
  Expect.runtimeIsType<C>(ca);
}
