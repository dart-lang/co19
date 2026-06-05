// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With a generative enum constructor that does not have the
/// modifier `const`, this modifier is implicitly induced. That is, `const` can
/// be omitted, but the constructor is constant anyway, and must satisfy all the
/// requirements of a generative `const` constructor.
///
/// @description Check that it is not an error is a generative enum constructor
/// doesn't have a `const` modifier.
/// @author sgrekhov22@gmail.com

enum E {
  e1,
  e2,
  e3.name();

  E();
  E.name() : this();
}

main() {
  print(E);
}
