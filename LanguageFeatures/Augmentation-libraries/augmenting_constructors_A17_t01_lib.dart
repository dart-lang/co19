// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting generative constructor marked `augment` adds its
/// redirection to the augmented constructor.
///
/// This converts it into a redirecting generative constructor, removing the
/// potentially non-redirecting property of the constructor.
///
/// @description Checks that an augmenting redirecting generative constructor
/// may add redirecting initializer to the augmented constructors initializer
/// list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A17_t01.dart';

augment class C {
  augment C.foo(int x, {int y}) : this(x, y);
  augment C.bar(int x, {required int y}) : this.foo(x, y: y);
}

augment enum E {
  augment e0;
  augment const E.foo(int x, {int y}): this(x, y);
  augment const E.bar(int x, {required int y}): this.foo(x, y: y);
}

augment extension type ET {
  augment ET.foo(int x, int y): this(x);
  augment ET.bar(int x, [int y]): this.foo(x, y);
  augment ET.baz(int x, {int y}): this.foo(x, y);
  augment ET.qux(int x, {required int y}): this.foo(x, y);
}
