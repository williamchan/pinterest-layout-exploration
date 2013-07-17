pinterest-layout-exploration
============================
Pinterest has a beautiful layout, and I was curious how they cascade their pins in neat columns.

To follow along, clone this repository and open the pinterest-layout.html in your browser.

### Pinterest layout

The first important ingredient of this layout is the div containing all of the pins:

    <div class="variableHeightLayout ... GridItems ..." style="height: 4665px;">
      ... items/pints ...
    </div>

In particular, there is a style called <code>.GridItems.variableHeightLayout>.item</code> that grants the rule <code>"position: absolute;"</code> to each grid item.

Inside that containing div are all of the pins aka items.

    <div class="variableHeightLayout padItems GridItems Module centeredWithinWrapper" style="height: 4665px;">
      <div class="item " style="top: 0px; left: 0px; visibility: visible;"> ... </div>
      <div class="item " style="top: 0px; left: 250px; visibility: visible;"> ... </div>
      <div class="item " style="top: 0px; left: 500px; visibility: visible;"> ... </div>
      <div class="item " style="top: 0px; left: 750px; visibility: visible;"> ... </div>
      <div class="item " style="top: 0px; left: 1000px; visibility: visible;"> ... </div>
      <div class="item " style="top: 238px; left: 0px; visibility: visible;"> ... </div>
      <div class="item " style="top: 324px; left: 500px; visibility: visible;"> ... </div>
      <div class="item " style="top: 362px; left: 250px; visibility: visible;"> ... </div>
      <div class="item " style="top: 431px; left: 750px; visibility: visible;"> ... </div>
      <div class="item " style="top: 622px; left: 1000px; visibility: visible;"> ... </div>
      <div class="item " style="top: 643px; left: 500px; visibility: visible;"> ... </div>
    </div>

Note how each item has an inline style.

Both "left" and "top" are calculated individually for each pin. The "left" values are 0px, 250px, 500px, 750px, or 1000px, which is how 5 columns are laid out. All pins, and hence each column, are constrained to 236px by the <code>".Pin.summary .pinWrapper"</code> syle. The "top" values are calculated for each based on the pins above it. And this all works because of <code>"position: absolute;"</code> as inherited from the containing div. 

While inline styles are generally discouraged, I must say this is quite a clever usage.

As for how "top" and "left" for each pin are calculated, that is controlled by the accompanying JS. That script runs every time a pinterest page is loaded, when additional pins are loaded, and when the window is resized (pinterest pages are adaptive and will lay out between 3 and 10 columns based on window size).

That script can be read if downloaded and unminified. Search for code that looks like "left=" and "top=". I am going to end my exploration here because it's a lot of JS. And besides, Pinterest employees kindly summarize that script in http://www.quora.com/Pinterest/What-technology-is-used-to-generate-pinterest-coms-absolute-div-stacking-layout.


### My exploration approach

The approach I followed was:
- I downloaded the html and css for my pinterest page.
- I pruned much of the html, leaving only the nav bar and tens pins.
- I downloaded the css and pruned much of that. There is a lot going on in CSS and also JS, which I'm ignoring here, and it is easier to follow along with only the html and css to inspect.
- I used Google Chrome Tools to inspect the elements and see how these pins are laid out. For example, I would delete styles 

### Also of interest

It'll be interesting to look at http://masonry.desandro.com, a JavaScript grid layout library.
