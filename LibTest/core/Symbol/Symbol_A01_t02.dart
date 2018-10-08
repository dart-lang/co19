/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Symbol(String name)
 * Constructs a new Symbol.
 *
 * The name must be a valid public Dart member name, public constructor name, or
 * library name, optionally qualified.
 *
 * A qualified name is a valid name preceded by a public identifier name and
 * a '.', e.g., foo.bar.baz= is a qualified version of baz=. That means that the
 * content of the name String must be either
 *
 * - a valid public Dart identifier (that is, an identifier not starting with "
 *    _"), such an identifier followed by "=" (a setter name),
 * - the name of a declarable operator (one of "+", "-", "*", "/", "%", "~/",
 *    "&", "|", "^", "~", "<<", ">>", "<", "<=", ">", ">=", "==", "[]", "[]=", or
 *    "unary-"),
 * -  any of the above preceded by any number of qualifiers, where a qualifier
 * is a non-private identifier followed by '.', or the empty string (the default
 * name of a library with no library name declaration).
 * @description Checks that symbols for operators can be created.
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(#~, const Symbol('~'));
  Expect.equals(#==, const Symbol('=='));
  Expect.equals(#[], const Symbol('[]'));
  Expect.equals(#[]=, const Symbol('[]='));

  Expect.equals(#*, const Symbol('*'));
  Expect.equals(#/, const Symbol('/'));
  Expect.equals(#%, const Symbol('%'));
  Expect.equals(#~/, const Symbol('~/'));

  Expect.equals(#+, const Symbol('+'));
  Expect.equals(#-, const Symbol('-'));

  Expect.equals(#<<, const Symbol('<<'));
  Expect.equals(#>>, const Symbol('>>'));

  Expect.equals(#<, const Symbol('<'));
  Expect.equals(#<=, const Symbol('<='));
  Expect.equals(#>, const Symbol('>'));
  Expect.equals(#>=, const Symbol('>='));

  Expect.equals(#&, const Symbol('&'));
  Expect.equals(#^, const Symbol('^'));
  Expect.equals(#|, const Symbol('|'));
}

