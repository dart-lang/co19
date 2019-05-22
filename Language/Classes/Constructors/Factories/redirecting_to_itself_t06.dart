/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a redirecting factory constructor
 * redirects to itself, either directly or indirectly via a sequence of
 * redirections.
 * @description Checks that compile-error occurs when named factory constructor
 * redirects to non-named and vice versa. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class F {
  factory F() = FAlias.id;
  factory F.id() = FAlias;
}
typedef FAlias = F;

main() {
  new F();
}
