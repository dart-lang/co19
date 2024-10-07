// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion URIs are specified by means of string literals:
/// uri:
///   stringLiteral
/// ;
/// It is a compile-time error if the string literal x that describes a URI
/// is not a compile-time constant, or if x involves string interpolation.
///
/// @description Checks that it is not a compile-time error when the URI in a
/// part directive consists of two adjacent multi-line string literals
/// instead of one.
/// @author sgrekhov22@gmail.com

part of 'syntax_t15.dart';

String id = "syntax_t15_part.dart";
