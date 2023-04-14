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
/// @description Check that it is not an error if a class declaration from
/// pre-feature library mixes in a class not declared as `mixin` but defined in
/// a platform library
/// @author sgrekhov22@gmail.com

// @dart=2.19

class C1 with Sink { // abstract class
  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

class C2 with Exception {} // abstract interface

class C3 with Function {} // abstract final

main() {
  print(C1);
  print(C2);
  print(C3);
}
