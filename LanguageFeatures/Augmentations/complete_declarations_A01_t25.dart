// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion More precisely, a function or constructor declaration
/// (introductory or augmenting) is incomplete if all of:
/// - It has no body. That means no `{ ... }` or `=> ...;` but only `;`.
/// - The function is not marked external. An external function is considered to
///   have a body, just not one that is visible as Dart code.
/// - There is no redirection, initializer list, initializing formals, field
///   parameters, or super parameters. Obviously, this only applies to
///   constructor declarations.
///
/// If a declaration is not incomplete then it is complete.
///
/// It's a compile-time error if an augmentation is complete and any declaration
/// before it in the augmentation chain is also complete.
///
/// @description Checks that it is not an error if an augmentation of a primary
/// constructor contains metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

const meta = 1;

class C1(var int x) {
  this : assert(x > 0);
}

augment class C1 {
  @meta augment this;
}

class C2.foo(int v) {
  this;
}

augment class C2 {
  @meta
  augment C2.foo(int v);
}

enum E1(final int x) {
  e0(0);
  this : assert(x > 0);
}

augment enum E1 {
  ;
  @meta augment this;
}

enum E2.foo(int v) {
  e0(0);
  this;
}

augment enum E2 {
  ;
  @meta
  augment E2.foo(int v);
}

extension type ET1(int v) {}

augment extension type ET1 {
  @meta
  augment  ET1(int v);
}

extension type ET2.foo(int v) {
  this;
}

augment extension type ET2 {
  @meta
  augment this;
}

extension type ET3.new(int v) {}

augment extension type ET3 {
  @meta
  augment ET3.new(int v);
}

main() {
  Expect.equals(1, C1(1).x);
  C2.foo(2);
  Expect.equals(0, E1.e0.x);
  E2.e0;
  Expect.equals(1, ET1(1).v);
  Expect.equals(2, ET2.foo(2).v);
  Expect.equals(3, ET3(3).v);
}
