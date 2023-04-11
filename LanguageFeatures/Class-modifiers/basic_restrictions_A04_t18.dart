// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `sealed` and
/// has a superdeclaration marked `sealed` in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class SealedClass {}

sealed class ExtendsSealedClass extends SealedClass {}

sealed class ImplementsSealedClass implements SealedClass {}

main() {
  print(ExtendsSealedClass);
  print(ImplementsSealedClass);
}
