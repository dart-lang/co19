// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Extension declarations can be augmented:
///
/// extensionDeclaration ::=
///     'extension' typeIdentifierNotType? typeParameters? 'on' type
///     memberedDeclarationBody
///   | 'augment' 'extension' typeIdentifierNotType typeParameters?
///     memberedDeclarationBody
///
/// Note that only extensions with names allow a leading augment. Since
/// augmentations are matched with their introductory declaration by name,
/// unnamed extensions can't be augmented.
///
/// @description Checks that an extension declaration can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
}

extension Ext on C {
}

augment extension Ext {
  int zero() => 0;
}

main() {
  Expect.equals(0, C().zero());
}
