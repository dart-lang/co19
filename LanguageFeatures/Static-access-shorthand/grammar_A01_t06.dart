// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We introduce grammar productions of the form:
/// ```
/// <postfixExpression> ::= ...            -- all current productions
///     | <staticMemberShorthand>          -- added production
///
/// <constantPattern> ::=  ...             -- all current productions
///     | <staticMemberShorthandValue>     -- No selectors, no `.new`.
///
/// <staticMemberShorthand> ::= <staticMemberShorthandHead> <selector>*
///
/// <staticMemberShorthandHead> ::=
///       <staticMemberShorthandValue>
///     | '.' 'new'                                       -- shorthand unnamed constructor
///
/// <staticMemberShorthandValue> ::=                      -- something that can potentially create a value.
///     | '.' <identifier>                                -- shorthand for qualified name
///     | 'const' '.' (<identifier> | 'new') <arguments>  -- shorthand for constant object creation
///  ```
///
/// @description Checks that `<staticMemberShorthand>` can be used in a constant
/// pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  final String value;
  const C(this.value);
  const C.foo(this.value);
}

extension type const ET(int v) {
  const ET.foo(this.v);
}

main() {
  bool success = false;
  var c1 = const <C>[.new("c1")];
  if (c1 case const <C>[.new("c1")]) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  var c2 = const <C>[.foo("c2")];
  if (c2 case const <C>[const .foo("c2")]) {
    success = true;
  }
  Expect.isTrue(success);

  var et1 = const <ET>[.new(1)];
  if (et1 case const <ET>[const .new(1)]) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  var et2 = const <ET>[.foo(2)];
  if (et2 case const <ET>[.foo(2)]) {
    success = true;
  }
  Expect.isTrue(success);
}
