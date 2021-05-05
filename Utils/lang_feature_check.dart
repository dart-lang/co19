// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of Expect;

typedef F<X> = void Function<Y extends X>();

typedef expected_target=Function<X>();

// Functions for correct type comparison in language feature tests
F<X> toF<X>(X x) => null;
Type typeOf<X>() => X;
