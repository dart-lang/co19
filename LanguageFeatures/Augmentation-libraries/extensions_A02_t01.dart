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
/// @description Checks that it is a compile-time error to augment an unnamed
/// extension declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
}

extension on C {
  int zero() => 0;
}

augment extension {
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  int one() => 1;
}

main() {
  print(C);
}
