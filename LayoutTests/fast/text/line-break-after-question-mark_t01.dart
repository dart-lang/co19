/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests when line breaking is allowed after a question mark character.
 */
import "../../testharness.dart";

void main() {
    DivElement div = document.body.append(document.createElement("div")) as DivElement;
    div.style.width = "1px";
    div.style.fontFamily = "Ahem";
    div.style.fontSize = "25px";
    
    List<int> unallowedBreaks = [0x21, 0x22, 0x27, 0x29, 0x2c, 0x2e, 0x2f, 0x3a, 0x3b, 0x3f, 0x5d, 0x7d];
    
    bool allowsBreakBefore(i) {
        div.text = "A?" + new String.fromCharCode(i);
        return div.offsetHeight > 25;
    }
    
    for (int i = 33; i < 128; ++i) {
        shouldBe(allowsBreakBefore(i), unallowedBreaks.indexOf(i) < 0, "for $i");
    }
    checkTestFailures();
}