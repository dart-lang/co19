// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a library contains two top-level
/// declarations with the same name, and:
/// - Neither is an augmenting declaration, or
/// - one of the declarations is a class-like declarations and the other is not
///   of the same kind, meaning that at either one is a class, mixin, enum,
///   extension or extension type declaration, and the other is not the same
///   kind of declaration.
///
/// @description Checks that it is a compile-time error to augment a mixin
/// application class with `=` syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_types_A01_t04.dart';

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
