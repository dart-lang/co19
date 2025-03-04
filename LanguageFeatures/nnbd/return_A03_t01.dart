// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The dynamic semantics specified at this location is changed as
/// follows, where $f$ is the enclosing function with declared return type $T$,
/// and $e$ is the returned expression:
///
///  When $f$ is a synchronous non-generator, evaluation proceeds as follows:
///  The expression $e$ is evaluated to an object $o$.
///  A dynamic error occurs unless the dynamic type of $o$ is a subtype of
///  the actual return type of $f$
///  (\ref{actualTypes}).
///  Then the return statement $s$ completes returning $o$
///  (\ref{statementCompletion}).
///
///  \commentary{%
///  The case where the evaluation of $e$ throws is covered by the general rule
///  which propagates the throwing completion from $e$ to $s$ to the function body.%
///  }
///
///  When $f$ is an asynchronous non-generator with future value type $T_v$
///  (\ref{functions}), evaluation proceeds as follows:
///  The expression $e$ is evaluated to an object $o$.
///  If the run-time type of $o$ is a subtype of \code{Future<$T_v$>},
///  let \code{v} be a fresh variable bound to $o$ and
///  evaluate \code{\AWAIT{} v} to an object $r$;
///  otherwise let $r$ be $o$.
///  A dynamic error occurs unless the dynamic type of $r$
///  is a subtype of the actual value of $T_v$
///  (\ref{actualTypes}).
///  Then the return statement $s$ completes returning $r$
///  (\ref{statementCompletion}).
///
///  \commentary{%
///  The cases where $f$ is a generator cannot occur,
///  because in that case $s$ is a compile-time error.%
///  }
///
/// @description Check that a dynamic error occurs unless the dynamic type of $r$
/// is a subtype of the actual value of $T_v$
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

int f1() {
  dynamic x = 3.14;
  return x;
}

main() {
  Expect.throws(() {
    f1();
  });
}
