// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Helper library for testing extension types
/// @author sgrekhov22@gmail.com

library extension_type_lib;

int x = 42;

class A {}

final class FinalClass {}

base class BaseClass {}

sealed class SealedClass {}

class ExtendsSealedClass extends SealedClass {}

extension type _PrivateExtensionType(int id) {}

extension type LibraryExtensionTypeInt(int id) {}

extension type LibraryExtensionTypeInt2(int _id) {}
