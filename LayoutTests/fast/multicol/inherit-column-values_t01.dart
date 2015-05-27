/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
    div {
        border: 1px solid black;
        -webkit-column-rule: 1px solid black;
    }
</style>
''';

const String htmlEL2 = r'''
<div style="-webkit-columns: 64px 2;" id="parent">
    <div style="-webkit-columns: inherit;" id="child0">
    Vestibulum a sapien. Phasellus ante lacus, vehicula non, cursus a, tempor ut, magna. Suspendisse potenti. Fusce aliquet, odio viverra vulputate dictum, enim odio luctus purus, ut scelerisque quam nulla non est. Donec eros lacus, egestas vitae, lacinia quis, tempor quis, pede. Morbi orci erat, iaculis id, ornare ac, elementum at, sem. Nunc ornare sodales nisi. Morbi interdum commodo nisl. Fusce eget eros non nisi ornare facilisis. Sed placerat, est non posuere posuere, purus sem dignissim libero, a viverra tellus dolor vel lorem. Cras augue. Etiam ultricies consequat odio. Mauris ac libero. Etiam posuere, libero vitae euismod gravida, urna elit imperdiet magna, vel cursus elit felis non mauris. Donec orci erat, porta id, dignissim ut, posuere dictum, leo. Suspendisse scelerisque egestas nulla.
    </div>

    <div style="-webkit-column-count: inherit;" id="child1">
    Vestibulum a sapien. Phasellus ante lacus, vehicula non, cursus a, tempor ut, magna. Suspendisse potenti. Fusce aliquet, odio viverra vulputate dictum, enim odio luctus purus, ut scelerisque quam nulla non est. Donec eros lacus, egestas vitae, lacinia quis, tempor quis, pede. Morbi orci erat, iaculis id, ornare ac, elementum at, sem. Nunc ornare sodales nisi. Morbi interdum commodo nisl. Fusce eget eros non nisi ornare facilisis. Sed placerat, est non posuere posuere, purus sem dignissim libero, a viverra tellus dolor vel lorem. Cras augue. Etiam ultricies consequat odio. Mauris ac libero. Etiam posuere, libero vitae euismod gravida, urna elit imperdiet magna, vel cursus elit felis non mauris. Donec orci erat, porta id, dignissim ut, posuere dictum, leo. Suspendisse scelerisque egestas nulla.
    </div>

    <div style="-webkit-column-width: inherit;" id="child2">
    Vestibulum a sapien. Phasellus ante lacus, vehicula non, cursus a, tempor ut, magna. Suspendisse potenti. Fusce aliquet, odio viverra vulputate dictum, enim odio luctus purus, ut scelerisque quam nulla non est. Donec eros lacus, egestas vitae, lacinia quis, tempor quis, pede. Morbi orci erat, iaculis id, ornare ac, elementum at, sem. Nunc ornare sodales nisi. Morbi interdum commodo nisl. Fusce eget eros non nisi ornare facilisis. Sed placerat, est non posuere posuere, purus sem dignissim libero, a viverra tellus dolor vel lorem. Cras augue. Etiam ultricies consequat odio. Mauris ac libero. Etiam posuere, libero vitae euismod gravida, urna elit imperdiet magna, vel cursus elit felis non mauris. Donec orci erat, porta id, dignissim ut, posuere dictum, leo. Suspendisse scelerisque egestas nulla.
    </div>
</div>
''';

void test1(id, property, value) {
    var element = document.getElementById(id);
    var result = element.getComputedStyle(null).getPropertyValue(property);
    shouldBe(result, value, "($id $property $value)");
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    test1("parent", "-webkit-column-count", "2");
    test1("parent", "-webkit-column-width", "64px");
    test1("child0", "-webkit-column-count", "2");
    test1("child0", "-webkit-column-width", "64px");
    test1("child1", "-webkit-column-count", "2");
    test1("child1", "-webkit-column-width", "auto");
    test1("child2", "-webkit-column-count", "auto");
    test1("child2", "-webkit-column-width", "64px");
	
    checkTestFailures();
}
