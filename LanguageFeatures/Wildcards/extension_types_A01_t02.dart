// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type declaration has a `<representationDeclaration>`
/// which is similar to a formal parameter list of a function declaration.
/// ...
/// This parameter can have the declared name `_`. This means that the
/// representation variable is named `_`, and no formal parameter name is
/// introduced into any scopes.
///
/// @description Checks that representation variable of an extension type may
/// have name `_`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class C {
  final int _;
  const C(this._);
}

C _ = C(42);

extension type ET1(C _) implements C {
  C get value => _;
  C get sameValue => this._;
}

extension type const ET2(C _) implements C {
  C get value => _;
  C get sameValue => this._;
}

main() {
  Expect.equals(1, ET1(C(1))._._);
  Expect.equals(2, ET1(C(2)).value._);
  Expect.equals(3, ET1(C(3)).sameValue._);

  Expect.equals(1, const ET2(C(1))._._);
  Expect.equals(2, const ET2(C(2)).value._);
  Expect.equals(3, const ET2(C(3)).sameValue._);
}
