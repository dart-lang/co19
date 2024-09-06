// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// ...
/// - Add initializers to the initializer list. If the augmenting constructor
///   has an initializer list then:
///   ...
///   - Otherwise the result of applying the augmenting constructor has an
///     initializer list containing first the assertions and field initializers
///     of the augmented constructor, if any, then the assertions and field
///     initializers of the augmenting constructor, and finally any
///     super-initializer of either the augmented or augmenting constructor.
///
/// @description Checks that the result of applying the augmenting constructor
/// has an initializer list containing first the assertions and field
/// initializers of the augmented constructor, then the assertions and field
/// initializers of the augmenting constructor, and finally super-initializer of
/// either the augmented or augmenting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A15_t01.dart';

augment class C {
  augment C(int x, int y, int z): assert(x++ == 1), this.y = y;
  augment C.foo(int x, int y, int z): this.y = y, assert(y++ == 1), super(++z);
  augment C.bar(int x, int y, int z): this.x = x, this.y = y, super(z);
}
