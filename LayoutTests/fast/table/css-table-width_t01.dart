/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test checks that the width style is applied correctly to
 * CSS tables with respect to table paddings and borders.
 */
import "dart:html";
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
''';

const String htmlEL2 = r'''
''';

Element computeCSSTableOffsetWidth(extraTableStyle) {
    Element table = computeCSSTable(extraTableStyle);
    var propertyValue = table.offsetWidth;
    table.remove();
    return propertyValue;
}

Element computeCSSTableOffsetHeight(extraTableStyle) {
    Element table = computeCSSTable(extraTableStyle);
    var propertyValue = table.offsetHeight;
    table.remove();
    return propertyValue;
}

Element computeCSSTable(extraTableStyle) {
    Element table = new Element.tag("div");
    table.setAttribute("style", "display: table; " + extraTableStyle);

    Element rowGroup = new Element.tag("div");
    rowGroup.setAttribute("style", "display: table-row-group;");

    Element row = new Element.tag("div");
    row.setAttribute("style", "display: table-row;");

    Element cell = new Element.tag("div");
    cell.setAttribute("style", "display: table-cell;");

    Element cellContent = new Element.tag("div");
    cellContent.setAttribute("style", "width: 100px; height: 50px; background-color: #090;");

    document.body.append(table);
    table.append(rowGroup);
    rowGroup.append(row);
    row.append(cell);
    cell.append(cellContent);

    return table;
}

void main() {
    description("This test checks that the width style is applied correctly to CSS tables with respect to table paddings and borders.");

    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    
    // separated borders

    shouldBe(computeCSSTableOffsetWidth('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px;'), 200+2+4+6+8);
    shouldBe(computeCSSTableOffsetWidth('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; direction: rtl;'), 200+2+4+6+8);
    
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl;'), 150+10+30+50+70);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl; -webkit-text-orientation: upright; text-orientation: upright;'), 150+10+30+50+70);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl; direction: rtl;'), 150+10+30+50+70);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl; direction: rtl; -webkit-text-orientation: upright; text-orientation: upright;'), 150+10+30+50+70);
    
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr;'), 150+10+30+50+70);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr; -webkit-text-orientation: upright; text-orientation: upright;'), 150+10+30+50+70);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr; direction: rtl;'), 150+10+30+50+70);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr; direction: rtl; -webkit-text-orientation: upright; text-orientation: upright;'), 150+10+30+50+70);
    
    // collapsed borders
    
    shouldBe(computeCSSTableOffsetWidth('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse;'), 200+(2+4)/2);
    shouldBe(computeCSSTableOffsetWidth('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; direction: rtl;'), 200+(2+4)/2);
    
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl;'), 150+(10+30)/2);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl; -webkit-text-orientation: upright; text-orientation: upright;'), 150+(10+30)/2);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl; direction: rtl;'), 150+(10+30)/2);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-rl; writing-mode: vertical-rl; direction: rtl; -webkit-text-orientation: upright; text-orientation: upright;'), 150+(10+30)/2);
    
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr;'), 150+(10+30)/2);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr; -webkit-text-orientation: upright; text-orientation: upright;'), 150+(10+30)/2);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr; direction: rtl;'), 150+(10+30)/2);
    shouldBe(computeCSSTableOffsetHeight('width: 200px; height: 150px; border-style: solid; border-width: 10px 2px 30px 4px; padding: 50px 6px 70px 8px; border-collapse: collapse; -webkit-writing-mode: vertical-lr; writing-mode: vertical-lr; direction: rtl; -webkit-text-orientation: upright; text-orientation: upright;'), 150+(10+30)/2);

    checkTestFailures();
}
