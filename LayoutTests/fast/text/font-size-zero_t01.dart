/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "../../testharness.dart";

void main() {
    var s = document.createElement('span');
    s.style.fontSize = '0px';
    s.innerHtml = 'Text';
    document.body.append(s);
    
    shouldBe(s.getBoundingClientRect().height, 0);
    shouldBe(s.getBoundingClientRect().width, 0);
    checkTestFailures();
}
