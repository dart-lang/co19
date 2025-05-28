// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Common library for js_interop tests.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JS()
external void eval(String code);
