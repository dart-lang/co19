// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion an extension declaration is a top-level declaration with a grammar
/// similar to:
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// ...
/// The member declarations can be any non-abstract static or instance member
/// declaration except for instance variables and constructors, and they cannot
/// have the same name as a member declared by Object (==, hashCode, toString,
/// runtimeType or noSuchMethod)
///
/// @description Check that it is not an error if extension declares an external
/// instance variable (an external instance variable is just a notation for an
/// external getter and (if not final) an external setter).
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

extension ExtendedList<T> on List<T> {
  external int foo;
}

main() {
  Expect.throws(() {
    [].foo;
  });
  Expect.throws(() {
    [].foo = 0;
  });
}
