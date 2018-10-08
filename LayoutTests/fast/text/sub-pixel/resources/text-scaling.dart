library text_scaling;
import "dart:html";

double TOLERANCE = 0.01;

double FONT_SIZE_START = 10.0;
double FONT_SIZE_BASELINE = 12.0;
double FONT_SIZE_STEP = 0.25;
double FONT_SIZE_END = 25.0;

Text numberToNode(num n) {
    return new Text(n.toStringAsFixed(2));
}

Element createElement(String tagName, [String opt_textContent, String opt_className]) {
    Element el = new Element.tag(tagName);
    if (opt_className!=null) {
        el.className = opt_className;
    }
    if (opt_textContent!=null) {
        el.append(new Text(opt_textContent));
    }
    return el;
}

int runTest(Element containerEl, String pangram, [String opt_writingMode]) {
    var cont = document.getElementById('test');

    var el = createElement('div', null, 'header');
    el.append(createElement('div', 'Font Size'));
    el.append(createElement('div', 'Width'));
    el.append(createElement('div', 'Normalized'));
    el.append(createElement('div', 'Diff'));
    el.append(createElement('span', 'Content'));
    containerEl.append(el);
    var referenceElement;
    for (double fontSize = FONT_SIZE_START;
            fontSize < FONT_SIZE_END;
            fontSize += FONT_SIZE_STEP) {
        var el = createElement('div');
        el.append(createElement('div'));
        el.append(createElement('div'));
        el.append(createElement('div'));
        el.append(createElement('div', null, 'results'));
        var textSpan = createElement('span');
        el.append(textSpan);
        textSpan.append(new  Text(pangram));
        textSpan.style.fontSize = "${fontSize}px";
        containerEl.append(el);
        if (fontSize == FONT_SIZE_BASELINE) {
            referenceElement = el;
        }
    }

    referenceElement.className = 'reference';
    var rect = referenceElement.lastChild.getBoundingClientRect();
    var expectedWidth = opt_writingMode == 'vertical' ? rect.height : rect.width;

    var failures = 0;
    for (int i = 0; i<containerEl.children.length-1; i++) {
        Element row = containerEl.children[i + 1];
        Rectangle rect = (row.lastChild as Element).getBoundingClientRect();
        double fontSize = FONT_SIZE_START + (FONT_SIZE_STEP * i);
        var width = opt_writingMode == 'vertical' ? rect.height : rect.width;
        var normalizedWidth = (width / fontSize) * FONT_SIZE_BASELINE;
        row.children[0].append(numberToNode(fontSize));
        row.children[1].append(numberToNode(width));
        row.children[2].append(numberToNode(normalizedWidth));
        row.children[3].append(numberToNode(normalizedWidth - expectedWidth));
        if ((expectedWidth - normalizedWidth).abs() <= TOLERANCE) {
            row.classes.add('size-pass');
        } else {
print("faiure: $expectedWidth !=  $normalizedWidth");
            row.classes.add('size-fail');
            failures++;
        }
    }

    return failures;
}
