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
/// may replace existing redirecting initializer of the augmented constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A17_t02.dart';

augment class C {
  augment C.bar(int x) : this.foo(x + 1);
}
