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
/// @description Checks that it is not an error if an augmentation of an already
/// completed primary constructor contains metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

const meta = 1;

class C1(int v) { // The constructor is complete because has a body
  this {}
}

augment class C1 {
  @meta augment C1(int v);
}

class C2(var int v) {} // Complete because has a declaring parameter

augment class C2 {
  @meta augment C2(int v);
}

class C3.foo(int v) { // Complete because has an initializer list
  int v;
  this : v = v;
}

augment class C3 {
  @meta
  augment C3.foo(int v);
}

class C4(this.v) { // Complete because has an initializing formals
  int v;
}

augment class C4 {
  @meta
  augment C4(int v);
}

enum E1(final int v) { // Declaring parameter
  e0(1);
}

augment enum E1 {
  ;
  @meta augment const E1(int v);
}

enum E2.foo(int v) { // Initializer list
  e0.foo(2);

  final int v;
  this : v = v;
}

augment enum E2 {
  ;
  @meta
  augment const E2.foo(int v);
}

enum E3(this.v) { // Initializing formals
  e0(3);

  final int v;
}

augment enum E3 {
  ;
  @meta
  augment const E3(int v);
}

extension type ET1(int v) {}

augment extension type ET1 {
  @meta
  augment  ET1(int v);
}

extension type ET2.new(int v) {}

augment extension type ET2 {
  @meta
  augment ET2.new(int v);
}

main() {
  C1(1);
  Expect.equals(2, C2(2).v);
  Expect.equals(3, C3.foo(3).v);
  Expect.equals(4, C4(4).v);
  Expect.equals(1, E1.e0.v);
  Expect.equals(2, E2.e0.v);
  Expect.equals(3, E3.e0.v);
  Expect.equals(1, ET1(1).v);
  Expect.equals(2, ET2(2).v);
}
