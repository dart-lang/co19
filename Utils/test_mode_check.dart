// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test_mode_check;
import 'dart:io';

typedef CheckFunction = bool Function(String str);

bool checkResolvedExecutable(CheckFunction function) {
  var uriParts = Uri.file(Platform.resolvedExecutable).pathSegments;
  String baseName =  uriParts[uriParts.length - 1];
  var pos = baseName.lastIndexOf('.');
  String result = (pos != -1) ? baseName.substring(0, pos) : baseName;
  return function(result);
}

/// Checks that application runs in dart precompiled runtime mode.
bool get isDartkp =>
    checkResolvedExecutable(((String s) => s == "dartaotruntime"));

/// Checks that application runs in AOT mode.
bool get isAot => checkResolvedExecutable(((String str) => str != "dart"));
