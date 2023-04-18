// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Library containing pre-feature classes for testing class
/// modifiers
/// @author sgrekhov22@gmail.com

// @dart=2.19

library class_modifiers_pre_feature_lib;

class Class {}
abstract class AbstractClass {}
mixin Mixin {}

typedef TypedefClass = Class;
typedef TypedefAbstractClass = AbstractClass;
typedef TypedefMixin = Mixin;
