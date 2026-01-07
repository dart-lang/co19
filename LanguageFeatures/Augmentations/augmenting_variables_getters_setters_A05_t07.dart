// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A getter or setter (including one implicitly induced by a variable
/// declaration) is not complete after all augmentations are applied, unless
/// it's an instance member and the surrounding class is `abstract`.
///
/// @description Checks that it is not an error if an implicit setter is
/// not complete after all augmentations are applied but the surrounding class
/// is `abstract`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract class C {
  abstract int instanceVariable;
  augment abstract int instanceVariable;
  augment int get instanceVariable;
}

main() {
  print(C);
}
