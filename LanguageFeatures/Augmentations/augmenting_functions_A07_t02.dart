// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - No declaration in the augmentation chain specifies a default value for an
///   optional parameter whose declared type is potentially non-nullable, and
///   the declared function is not abstract.
///
/// @description Checks that it is not an error if no declaration in the
/// augmentation chain specifies a default value for an optional parameter whose
/// declared type is potentially non-nullable, but the declared function is
/// abstract.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract class C {
  void instanceMethod1([int v]);
  void instanceMethod2({int v});
}

augment class C {
  augment void instanceMethod1([int v]);
  augment void instanceMethod2({int v});
}

main() {
  print(C);
}
