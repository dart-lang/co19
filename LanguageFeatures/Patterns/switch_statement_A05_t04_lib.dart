// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend switch statements to allow patterns in cases:
///
/// switchStatement         ::= 'switch' '(' expression ')'
///                         '{' switchStatementCase* switchStatementDefault? '}'
/// switchStatementCase     ::= label* 'case' guardedPattern ':' statements
/// guardedPattern          ::= pattern ( 'when' expression )?
/// switchStatementDefault  ::= label* 'default' ':' statements
/// ...
/// Many constant expressions are subsumed by the new pattern syntax so most
/// existing switch cases have the same semantics under this proposal. However,
/// patterns are not a strict superset of constant expressions and some switches
/// may be broken.
/// ...
/// Other constant expressions. Constant patterns allow simple literals and
/// references to named constants to be used directly as patterns, which covers
/// the majority of all existing switch cases. Also a constant constructor
/// explicitly prefixed with const is a valid constant expression pattern. But
/// some more complex expressions are valid constant expressions but not valid
/// constant patterns.
///
/// @description Check that binary operator expressions derived from
/// `bitwiseOrExpression` are not valid in a `guardedPattern` and produce a
/// compile-time error. Test a library prefix.
/// @author sgrekhov22@gmail.com
/// @issue 63356

const a = 1;
const b = 2;
