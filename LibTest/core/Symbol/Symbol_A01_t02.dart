// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion const Symbol(String name)
/// Constructs a new Symbol representing the provided name.
///
/// Symbols created from equal name strings are themselves equal. If the symbols
/// are created using const, symbols with the same name strings are
/// canonicalized and identical.
///
/// Some name strings create symbols which can also be created using a symbol
/// literal, or be implicitly created while running Dart programs, for example
/// through Object.noSuchMethod.
///
/// If name is a single Dart identifier that does not start with an underscore,
/// or it is a qualified identifier (multiple identifiers separated by .s), or
/// it is the name of a user definable operator different from unary- (one of
/// "+", "-", "*", "/", "%", "~/", "&", "|", "^", "~", "<<", ">>", ">>>", "<",
/// "<=", ">", ">=", "==", "[]", or "[]="), then the result of Symbol(name) is
/// equal to the symbol literal created by prefixing # to the contents of name,
/// and const Symbol(name) is identical to that symbol literal.
/// That is #foo == Symbol("foo") and identical(#foo, const Symbol("foo")).
///
/// If name is a single identifier that does not start with an underscore
/// followed by a =, then the symbol is a setter name, and can be equal to the
/// Invocation.memberName in an Object.noSuchMethod invocation.
///
/// Private symbol literals, like #_foo, cannot be created using the symbol
/// constructor. A symbol like const Symbol("_foo") is not equal to any symbol
/// literal, or to any source name symbol introduced by noSuchMethod.
///
/// assert(Symbol("foo") == Symbol("foo"));
/// assert(Symbol("foo") == #foo);
/// assert(identical(const Symbol("foo"), const Symbol("foo")));
/// assert(identical(const Symbol("foo"), #foo));
/// assert(Symbol("[]=") == #[]=]);
/// assert(identical(const Symbol("[]="), #[]=));
/// assert(Symbol("foo.bar") == #foo.bar);
/// assert(identical(const Symbol("foo.bar"), #foo.bar));
/// The created instance overrides Object.==.
///
/// @description Checks that if the symbols are created using const, symbols
/// with the same name strings are canonicalized and identical.
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  const s1 = const Symbol('foo');
  var s2 = const Symbol('foo');
  Expect.identical(s1, s2);

  const s3 = const Symbol(r'foo.bar$');
  const s4 = const Symbol(r'foo.bar$');
  Expect.identical(s3, s4);

  var s5 = const Symbol(r'foo.bar$.baz_=');
  var s6 = const Symbol(r'foo.bar$.baz_=');
  Expect.identical(s5, s6);

  var s7 = const Symbol('foo.b_a_r');
  var s8 = const Symbol('foo.b_a_r');
  Expect.identical(s7, s8);
}
