/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
library opted_in_aliases_lib;

class A {
}

typedef AAliasNonNullable = A;
typedef AAliasNullable = A?;
typedef StringAliasNonNullable = String;
typedef StringAliasNullable = String?;
typedef IntAliasNonNullable = int;
typedef IntAliasNullable = int?;
typedef NeverAlias = Never;
