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

int _ = 42;

extension type ET1(int _) {
  int get value => _;
  int get sameValue => this._;
}

extension type const ET2(int _) {
  int get value => _;
  int get sameValue => this._;
}

main() {
  Expect.equals(1, ET1(1)._);
  Expect.equals(2, ET1(2).value);
  Expect.equals(3, ET1(3).sameValue);

  Expect.equals(1, const ET2(1)._);
  Expect.equals(2, const ET2(2).value);
  Expect.equals(3, const ET2(3).sameValue);
}
