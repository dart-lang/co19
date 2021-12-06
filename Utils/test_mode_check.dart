// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test_mode_check;
import "dart:io";

typedef check = bool Function(String);

bool checkMode(check ret) {
  var parts = Uri.file(Platform.resolvedExecutable).pathSegments;
  String basename =  parts[parts.length - 1];
  var pos = basename.lastIndexOf('.');
  String result = (pos != -1) ? basename.substring(0, pos) : basename;
  return ret(result);
}

// Checks that application runs in dart precompiled runtime mode.
bool get isDartkp => checkMode(((String s) => s == "dart_precompiled_runtime"));

// Checks that application runs in AOT mode.
bool get isAOT => checkMode(((String s) => s != "dart"));
