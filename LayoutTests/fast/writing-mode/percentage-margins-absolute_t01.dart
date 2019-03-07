/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Percentage margins on absolutely positioned elements are relative to the container\'s logical width 
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../../Utils/expect.dart";

var WritingModes = {
    'HORIZONTAL-TB': 'horizontal-tb',
    'VERTICAL-LR': 'vertical-lr',
    'VERTICAL-RL': 'vertical-rl'
};

var outerProperties = {
    "position": 'relative',
    "width": '100px',
    "height": '200px',
};

var  innerProperties = {
    "position": 'absolute',
    "width": '40px',
    "height": '160px',
};

var expectedProperties = {
    "margin": '10px 20px 30px 40px'
};

void testMargins(outerProperties, innerProperties, expectedProperties) {
    var outer = document.createElement('div'),
        inner = document.createElement('div'),
        property, style;
    for (property in outerProperties.keys)
        outer.style.setProperty(property, outerProperties[property]);
    for (property in innerProperties.keys)
        inner.style.setProperty(property, innerProperties[property]);
    outer.append(inner);
    document.body.append(outer);
    style = inner.getComputedStyle();
    for (property in expectedProperties.keys) {
        Expect.equals('"${expectedProperties[property]}"', '"${style.getPropertyValue(property)}"');
    }
    outer.remove();
}

void doTest(e) {
    for (var outerProperty in WritingModes.keys) {
        for (var innerProperty in WritingModes.keys) {
            outerProperties['-webkit-writing-mode'] = WritingModes[outerProperty];
            innerProperties['-webkit-writing-mode'] = WritingModes[innerProperty];
            innerProperties['margin'] = (outerProperty == 'HORIZONTAL-TB' ? '10% 20% 30% 40%' : '5% 10% 15% 20%');
            testMargins(outerProperties, innerProperties, expectedProperties);
        }
    }
    print("test passed");
}

void main() {
    tc.addOnLoadListener(doTest);
}
