/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "override_checking_A03_opted_in_lib.dart";

class LEGACY_ARGS_1 extends OPTED_NULLABLE_ARGS    implements OPTED_NONNULLABLE_ARGS {}
class LEGACY_ARGS_2 extends OPTED_NONNULLABLE_ARGS implements OPTED_NULLABLE_ARGS    {}

class LEGACY_FIELDS_1 extends OPTED_NULLABLE_FIELD    implements OPTED_NONNULLABLE_FIELD {}
class LEGACY_FIELDS_2 extends OPTED_NONNULLABLE_FIELD implements OPTED_NULLABLE_FIELD    {}

class LEGACY_GETTER_1 extends OPTED_NULLABLE_GETTER    implements OPTED_NONNULLABLE_GETTER {}
class LEGACY_GETTER_2 extends OPTED_NONNULLABLE_GETTER implements OPTED_NULLABLE_GETTER    {}

class LEGACY_SETTER_1 extends OPTED_NULLABLE_SETTER    implements OPTED_NONNULLABLE_SETTER {}
class LEGACY_SETTER_2 extends OPTED_NONNULLABLE_SETTER implements OPTED_NULLABLE_SETTER    {}

class LEGACY_RETURN_1 extends OPTED_NULLABLE_RETURN    implements OPTED_NONNULLABLE_RETURN {}
class LEGACY_RETURN_2 extends OPTED_NONNULLABLE_RETURN implements OPTED_NULLABLE_RETURN    {}

class LEGACY_INT_1<T extends int> extends OPTED_NONNULLABLE_INT<T> implements OPTED_NULLABLE_INT   <T> {}
class LEGACY_INT_2<T extends int> extends OPTED_NULLABLE_INT   <T> implements OPTED_NONNULLABLE_INT<T> {}

class LEGACY_OBJECT_1<T extends Object> extends OPTED_NONNULLABLE_OBJECT<T> implements OPTED_NULLABLE_OBJECT   <T> {}
class LEGACY_OBJECT_2<T extends Object> extends OPTED_NULLABLE_OBJECT   <T> implements OPTED_NONNULLABLE_OBJECT<T> {}

class LEGACY_FUNCTION_1<T extends Function> extends OPTED_NONNULLABLE_FUNCTION<T> implements OPTED_NULLABLE_FUNCTION  <T> {}
class LEGACY_FUNCTION_2<T extends Function> extends OPTED_NULLABLE_FUNCTION<T>    implements OPTED_NONNULLABLE_FUNCTION<T> {}
