// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class or enum declaration D from
/// library L has S from library K as a declared mixin, unless:
/// - S is a mixin or mixin class declaration (necessarily from a post-feature
///   library), or
/// - S is a non-mixin class declaration which has Object as superclass and
///   declares no generative constructor, and either
///   - K is a pre-feature library, or
///   - K is a platform library and L is a pre-feature library.
///
/// @description Check that it is not an error if a class declaration mixes in
/// a class not declared as `mixin`, but defined in a pre-feature library
/// @author sgrekhov22@gmail.com

import "class_modifiers_pre_feature_lib.dart";

class C1 with Class {}

class C2 with AbstractClass {}

base class BC1 with Class {}

base class BC2 with AbstractClass {}

interface class IC1 with Class {}

interface class IC2 with AbstractClass {}

final class FC1 with Class {}

final class FC2 with AbstractClass {}

sealed class SC1 with Class {}

sealed class SC2 with AbstractClass {}

abstract class AC1 with Class {}

abstract class AC2 with AbstractClass {}

abstract base class ABC1 with Class {}

abstract base class ABC2 with AbstractClass {}

abstract interface class AIC1 with Class {}

abstract interface class AIC2 with AbstractClass {}

abstract final class AFC1 with Class {}

abstract final class AFC2 with AbstractClass {}

main() {
  print(C1);
  print(C2);
  print(BC1);
  print(BC2);
  print(IC1);
  print(IC2);
  print(FC1);
  print(FC2);
  print(SC1);
  print(SC2);
  print(AC1);
  print(AC2);
  print(ABC1);
  print(ABC2);
  print(AIC1);
  print(AIC2);
  print(AFC1);
  print(AFC2);
}
