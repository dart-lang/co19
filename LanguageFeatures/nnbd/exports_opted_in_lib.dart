/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

library override_opted_in_lib;

import "dart:async";
import "../../Utils/expect.dart";

// Nullable variables:
int?               nullable_i1;
Object?            nullable_o1;
dynamic            d1;
Function?          f1;
Null               n1;
FutureOr           fo1;
FutureOr<FutureOr> fofo1;

int?               nullable_i2 = null;
Object?            nullable_o2 = null;
dynamic            d2          = null;
Function?          f2          = null;
Null               n2          = null;
FutureOr           fo2         = null;
FutureOr<FutureOr> fofo2       = null;

int?               nullable_i3 = 1;
Object?            nullable_o3 = 1;
dynamic            d3          = 1;
Function?          f3          = testme;
FutureOr           fo3         = 1;
FutureOr<FutureOr> fofo3       = 1;

// Non-nullable variables:
int i            = 0;
Object o         = 0;
Function f       = testme;
FutureOr<int> fi = 0;

Never aNever = throw "Should not reach here";

// Generic classes:
class GENERIC_NONNULLABLE_INT<T extends int>           {}
class GENERIC_NONNULLABLE_OBJECT<T extends Object>     {}
class GENERIC_NONNULLABLE_FUNCTION<T extends Function> {}

class GENERIC_NULLABLE<T>                            {}
class GENERIC_DYNAMIC<T>                             {}
class GENERIC_NULLABLE_INT<T extends int?>           {}
class GENERIC_NULLABLE_OBJECT<T extends Object?>     {}
class GENERIC_NULLABLE_FUNCTION<T extends Function?> {}
class GENERIC_NULL<T extends Null>                   {}

class GENERIC_NEVER<T extends Never> {}

// Function typedefs:
typedef def = void Function();

typedef def_nullable_int_arg      = void Function(int? i);
typedef def_nullable_object_arg   = void Function(int? i);
typedef def_dynamic_arg           = void Function(dynamic i);
typedef def_nullable_function_arg = void Function(Function? f);
typedef def_null_arg              = void Function(Null n);
typedef def_futureOr_arg          = void Function(FutureOr i);

typedef def_int_arg         = void Function(int i);
typedef def_object_arg      = void Function(Object o);
typedef def_function_arg    = void Function(Function f);
typedef def_futureOrInt_arg = void Function(FutureOr<int> i);

typedef def_never_arg = void Function(Never n);

typedef def_required_arg = void Function({required int i});

typedef def_getNullableInt      = int? Function();
typedef def_getNullableObject   = Object? Function();
typedef def_getDynamic          = dynamic Function();
typedef def_getNullableFunction = Function? Function();
typedef def_getNull             = Null Function();
typedef def_getFutureOr         = FutureOr Function();

typedef def_getInt         = int Function();
typedef def_getObject      = Object Function();
typedef def_getFunction    = Function Function();
typedef def_getFutureOrInt = FutureOr<int> Function();

typedef def_getNever = Never Function();


// Functions:

void testme() {}

void test_nullable_int_arg(int? i)       { Expect.isNull(i); }
void test_nullable_object_arg(Object? i) { Expect.isNull(i); }
void test_dynamic_arg(dynamic i)         { Expect.isNull(i); }
void test_nullable_function(Function? f) { Expect.isNull(f); }
void test_null_arg(Null n)               { Expect.isNull(n); }
void test_futureOr_arg(FutureOr i)       { Expect.isNull(i); }

void test_int_arg(int i)                   { Expect.equals(1, i); }
void test_object_arg(Object o)             { Expect.equals(1, o); }
void test_function_arg(Function f)         { Expect.equals(testme, f); }
void test_futureOrInt_arg(FutureOr<int> i) { Expect.equals(1, i); }

void test_never_arg(Never n) {}

void test_required_arg({required int i}) { Expect.equals(1, i); }

int? getNullableInt()           => null;
Object? getNullableObject()     => null;
dynamic getDynamic()            => null;
Function? getNullableFunction() => null;
Null getNull()                  => null;
FutureOr getFutureOr()          => null;

int getInt()                   => 1;
Object getObject()             => 1;
Function getFunction()         => testme;
FutureOr<int> getFutureOrInt() => 1;

Never getNever() => throw("Should not reach here");

void testGenericDynamic<T>()                            { Expect.equals(Null, T); }
void testGenericNullableInt<T extends int?>()           { Expect.equals(Null, T); }
void testGenericNullableFunction<T extends Function?>() { Expect.equals(Null, T); }
void testGenericNullableObject<T extends Object?>()     { Expect.equals(Null, T); }
void testGenericNull<T extends Null>()                  { Expect.equals(Null, T); }
void testGenericFutureOr<T extends FutureOr>()          { Expect.equals(Null, T); }

void testGenericInt<T extends int>()           {}
void testGenericFunction<T extends Function>() {}
void testGenericObject<T extends Object>()     {}

void testGenericNever<T extends Never>() {}
