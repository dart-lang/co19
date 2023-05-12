// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <inlineClassDeclaration> is added to the grammar,
/// along with some rules for elements used in inline class declarations:
///
/// <inlineClassDeclaration> ::=
///   'final'? 'inline' 'class' <typeIdentifier> <typeParameters>? <interfaces>?
///   '{'
///     (<metadata> <inlineMemberDeclaration>)*
///   '}'
///
/// <inlineMemberDeclaration> ::= <classMemberDefinition>
///
/// @description Checks that an inline class can be declared as `final` and can
/// be extended, implemented and a mixin on it can be declared in the same
/// library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

final inline class FIC {
  final int id ;
  const FIC(this.id);
}

base class BC extends FIC {
  const BC(int id): super(id);
}

abstract base class ABC extends FIC {
  const ABC(int id): super(id);
}

final class FC extends FIC {
  const FC(int id): super(id);
}

abstract final class AFC extends FIC {
  const AFC(int id): super(id);
}

sealed class SC extends FIC {
  const SC(int id): super(id);
}

base class BC2 implements FIC {
  int id;
  BC2(this.id);
}

abstract base class ABC2 implements FIC {
  int id;
  ABC2(this.id);
}

final class FC2 implements FIC {
  int id;
  FC2(this.id);
}

abstract final class AFC2 implements FIC {
  int id;
  AFC2(this.id);
}

sealed class SC2 implements FIC {
  int id;
  SC2(this.id);
}

base mixin BMC on FIC {}

main() {
  Expect.equals(1, FIC(1).id);
  Expect.equals(2, BC(2).id);
  print(ABC);
  Expect.equals(3, FC(3).id);
  print(AFC);
  print(SC);
  Expect.equals(4, BC2(4).id);
  print(ABC2);
  Expect.equals(5, FC2(5).id);
  print(AFC2);
  print(SC2);
  print(BMC);
}
