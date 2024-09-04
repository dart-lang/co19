// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Common library for `scope*` tests.
///
/// @description Common library for `scope*` tests.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_lib1.dart';

void set libSetter(String _) {
  log = "libSetter";
}
String libFunc() => "libFunc";

enum LibEnum {
  e0;
  static final String id = "LibEnum";
  static final String _id = "LibEnum._id";
  final _private = "LibEnum._private";
}

extension type LibET(int _) {
  static final String id = "LibET";
  static final String _id = "LibET._id";
}
