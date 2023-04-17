// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is not an error if class marked
/// `abstract final` is extended in the same library where it is declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract final class AbstractFinalClass {}

base class BaseExtendsFinal extends AbstractFinalClass {}

final class FinalExtendsFinal extends AbstractFinalClass {}

sealed class SealedExtendsFinal extends AbstractFinalClass {}

abstract base class AbstractBaseExtendsFinal extends AbstractFinalClass {}

abstract final class AbstractFinalExtendsFinal extends AbstractFinalClass {}

main() {
  print(BaseExtendsFinal);
  print(FinalExtendsFinal);
  print(SealedExtendsFinal);
  print(AbstractBaseExtendsFinal);
  print(AbstractFinalExtendsFinal);
}
