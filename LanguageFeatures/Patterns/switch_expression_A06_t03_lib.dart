// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ```
/// primary                 ::= // Existing productions...
///                           | switchExpression
///
/// switchExpression      ::= 'switch' '(' expression ')' '{'
///                           switchExpressionCase ( ',' switchExpressionCase )*
///                           ','? '}'
/// switchExpressionCase  ::= guardedPattern '=>' expression
/// ```
/// @description Checks that pure `bitwiseOrExpression` constant expressions are
/// not valid in a `guardedPattern` and produce a compile-time error. Test a
/// library prefix.
/// @author sgrekhov22@gmail.com
/// @issue 63356

const a = 1;
const b = 2;
