// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All imports and exports of the same URI in a Dart program denotes
/// the same library, and imports or exports of different URIs denote distinct
/// libraries.
///
/// @description Checks that imports of the same URI in a Dart program denotes
/// the same library. Test prefixed library.
/// @author sgrekhov22@gmail.com

import 'same_uri_common_lib.dart' as l4prefix;

int get lib4Increment => l4prefix.increment;

int get lib4Counter => l4prefix.counter;
