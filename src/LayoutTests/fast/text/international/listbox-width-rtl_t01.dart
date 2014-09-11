/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description  Test that text directionality is taken into account when
 * sizing list boxes.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

const String htmlEL1 = r'''
        <style>
            select, span { font: menu; }
        </style>
        <script src="../../../resources/js-test.js"></script>
''';

const String htmlEL2 = r'''
        <p>
            Test that text directionality is taken into account when
            sizing list boxes.
        </p>
        <select id="dropdown">
            <option dir="rtl">&#x0627;&#x0628; &#x0627;&#x0628;</option>
        </select>
        <select id="list" size="5">
            <option dir="rtl">&#x0627;&#x0628; &#x0627;&#x0628;</option>
        </select>
''';

num widthForEmptySelect(size) {
    var selectElement = new Element.tag('select');
    selectElement.size = size;
    document.body.append(selectElement);
    var selectWidth = selectElement.getBoundingClientRect().width;
    selectElement.remove();
    return selectWidth;
}

num widthForText(str) {
    var textElement = new Element.tag('span');
    textElement.append(new Text(str));
    document.body.append(textElement);
    var textWidth = textElement.getBoundingClientRect().width;
    textElement.remove();
    return textWidth;
}

var optionPaddingStart = 3;
var optionPaddingEnd = 2;

void testListbox(id) {
    var element = document.getElementById(id);
    var emptyWidth = widthForEmptySelect(element.size);
    Element firstElementChild=element.childNodes.firstWhere((x) => x is Element);
    var textWidth = widthForText(firstElementChild.text);
    var dropdownWidth = element.getBoundingClientRect().width;
    var expectedWidth = emptyWidth + textWidth + optionPaddingStart + optionPaddingEnd;
    Expect.isTrue((dropdownWidth - expectedWidth).abs() <= 1,
        'Width $id was ${dropdownWidth} px wide, expected ${expectedWidth} px (${emptyWidth}px for empty $id and ${textWidth} px for text).'
    );
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    testListbox('list');
}
