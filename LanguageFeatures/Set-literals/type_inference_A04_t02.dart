// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion To infer the type of element:
///
/// If element is an expressionElement with expression e1:
/// ...
/// If P is Set<Ps> then the inferred set element type of element is the inferred
/// type of the expression e1 in context Ps.
///
/// @description Checks that if P is Set<Ps> then the inferred set element type
/// of element is the inferred type of the expression e1 in context Ps.
///
/// See Issue 43139 evaluation: With null safety, doing 1 + x in a double context
/// will figure out that the only way int + something is going to be a double is
/// if the something is a double, so it will give x a context type of double.
/// Then double x = 1 + 1; will convert the latter 1 to a double literal, and the
/// result becomes a double. So, there is not compile error here with nnbd, and
/// it's a compile error without nnbd.
/// @Issue 43139
/// @author sgrekhov@unipro.ru

main() {
  Set<double> x = {1 + 1};
}
