// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Add final int index; and final String _$name; instance variable
/// declarations to the class. (We’ll represent fresh names by prefixing with _$
/// here and below).
///
/// For each member declaration:
///
/// If the member declaration is a (necessarily const) generative constructor,
/// introduce a similar named constructor on the class with a fresh name, which
/// takes two extra leading positional arguments
/// (Name.foo(...) ↦ Name._$foo(int .., String .., ...),
/// Name(...) ↦ Name._$(int .., String .., ...)). If the constructor is
/// non-redirecting, make the two arguments this.index and this._$name. If the
/// constructor is redirecting, make them int _$index and String _$name, then
/// change the target of the redirection to the corresponding freshly-renamed
/// constructor and pass _$index and _$name as two extra initial positional
/// arguments.
/// Otherwise include the member as written.
///
/// @description Check that index cannot be overwritten
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1(11),
  e2(22),
  e3(33);

  final int _index;
  int get index => _index;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const E1(this._index);
}

enum E2 {
  e1(11),
  e2(22),
  e3(33);

  final int _index;
  @override
  int get index => _index;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const E2(this._index);
}

main() {
  E1.e1;
  E2.e1;
}
