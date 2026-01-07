// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration. Test enum values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta {
  const Meta();
}

enum E {
  @Meta()
  e0;
}

augment enum E {
  @Meta()
  e1;
}

main() {
  ClassMirror classMirror = reflectClass(E);
  Symbol symbol = MirrorSystem .getSymbol("e0");
  DeclarationMirror varMirror =
      classMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals('.Meta',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));

  symbol = MirrorSystem .getSymbol("e1");
  varMirror = classMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals('.Meta',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
}
