// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the type in the extends clause of a
/// class C is a type variable, a type alias that does not denote a class, an
/// enumerated type, a deferred type, type dynamic, or type FutureOr<T> for any
/// T.
///
/// @description Checks that it is a compile-time error if a deferred type is
/// used as a superclass. This library will be used as the deferred import.
/// @author sgrekhov22@gmail.com

library superclass_lib;

class A {}
