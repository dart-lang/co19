/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

library override_opted_in_lib;

import "dart:async";

class A {}

// Nullable type aliases:
typedef NullableAAlias                                      = A?;
typedef NullableIntAlias                                    = int?;
typedef NullableFunctionAlias                               = Function?;
typedef NullableObjectAlias                                 = Object?;
typedef DynamicAlias                                        = dynamic;
typedef NullAlias                                           = Null;
typedef FutureOrAlias                                       = FutureOr;
typedef FutureOrFutureOrAlias<T extends FutureOr<FutureOr>> = FutureOr<T>;

// Non-nullable type aliases:
typedef AAlias                          = A;
typedef IntAlias                        = int;
typedef ObjectAlias                     = Object;
typedef FunctionAlias                   = Function;
typedef FutureOrIntAlias<T extends int> = FutureOr<T>;

// Never aliases:
typedef NeverAlias = Never;
