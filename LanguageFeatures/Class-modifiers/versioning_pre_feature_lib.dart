// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Library containing definitions of pre-feature classes which
/// have modifiers in their superdeclarations
/// @author sgrekhov22@gmail.com

// @dart=2.19

library versioning_pre_feature_lib;

class PreFeatureExtendsFinal extends Function {} // abstract final

class PreFeatureImplementsFinal implements Function {} // abstract final

class PreFeatureWithFinal with Function {} // abstract final

class PreFeatureImplementsInterface implements Exception {} // abstract interface

class PreFeatureWithInterface with Exception {} // abstract interface
