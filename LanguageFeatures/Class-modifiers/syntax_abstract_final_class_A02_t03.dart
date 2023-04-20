// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is not an error to extend
/// `abstract final class` in the same library where it is defined by a class
/// with `base/final/sealed` modifier
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract final class AbstractFinalClass {}

base class BaseExtendsFinal extends AbstractFinalClass {} // reopen

final class FinalExtendsFinal extends AbstractFinalClass {}

sealed class SealedExtendsFinal extends AbstractFinalClass {}

abstract base class AbstractBaseExtendsFinal
    extends AbstractFinalClass {} // reopen

abstract final class AbstractFinalExtendsFinal extends AbstractFinalClass {}

main() {
  print(BaseExtendsFinal);
  print(FinalExtendsFinal);
  print(SealedExtendsFinal);
  print(AbstractBaseExtendsFinal);
  print(AbstractFinalExtendsFinal);
}
