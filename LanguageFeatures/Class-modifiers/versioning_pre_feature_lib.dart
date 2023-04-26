// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Library containing definitions of pre-feature classes which
/// have modifiers in their superdeclarations
/// @author sgrekhov22@gmail.com

// @dart=2.19

library versioning_pre_feature_lib;

class PreFeatureExtendsFinal extends Runes { // final class
  PreFeatureExtendsFinal() : super("");
}

class PreFeatureImplementsFinal implements Runes { // final class
  dynamic noSuchMethod(Invocation i) {}
}

class PreFeatureWithFinal with BigInt { // abstract final class
  dynamic noSuchMethod(Invocation i) {}
}

class PreFeatureImplementsInterface implements Exception {} // abstract interface

class PreFeatureWithInterface with Exception {} // abstract interface
