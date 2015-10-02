GIFPoint
========

Middleman, Angular-powered HTML slides that make it super easy to add full-screen GIFs.

Setup
-----

```bash
bundle install
```

Next, we need to set up the project dependencies via Bower. If you don't have Bower installed:

```bash
# Install Bower globally
npm install -g bower
```

Install the dependencies:

```bash
bower install
```

Start the Middleman server:

```bash
middleman s
```

Go to `localhost:4567` and you should see the first slide.

Set Page Title
--------------

To set the page title, open up `config.rb` and change the `page_title`.

Creating Slides
---------------

All of the slides are in `source/index.haml`. They are written as Angular directives in Haml.

Here are some different slide types you can use:

### Basic Slide

```haml
/ Text
%slide
  .slide-content
    %h1 Slide Title

/ Title Slide
%slide.slide--title
  .slide-content
    %h1 Slide Title

/ Centered Text + Subtitle
%slide
  .slide-content
    .middle.tac
      %h1.mbxs Another Title
      %p This is a subtitle.

/ Image
%slide
  .slide-content
    .middle.tac
      = image_tag 'http://placehold.it/800x400', alt: 'Placeholder', class: 'slide-media'

%slide
  .slide-content
    .middle.tac
      = image_tag 'http://placehold.it/800x400', alt: 'Placeholder', class: 'slide-img'
```

### Colors

```haml
/ Light
%slide.slide--light
  .slide-content
    .middle.tac
      %h1 Light

/ Dark
%slide.slide--dark
  .slide-content
    .middle.tac
      %h1 Dark

/ Subdued
%slide.slide--subdue
  .slide-content
    .middle.tac
      %h1 Subdued

/ Success
%slide.slide--success
  .slide-content
    .middle.tac
      %h1 Success

/ Error
%slide.slide--error
  .slide-content
    .middle.tac
      %h1 Error

/ Warning
%slide.slide--warning
  .slide-content
    .middle.tac
      %h1 Warning

/ One-off Color
%slide(color='#f4f4f4')
  .slide-content
    .middle.tac
      %h1 Slide Title
```

### Code

```haml
%slide.slide--light
  .slide-content
    .middle.middle--auto
      :code
        # lang: sass

        // Code goes here...
```

### Positioning


```haml
/ Middle
%slide
  .slide-content
    .middle
      %h1 Slide Title

/ Middle Center (text)
%slide
  .slide-content
    .middle.tac
      %h1 Slide Title

/ Bottom
%slide
  .slide-content
    .bottom
      %h1 Slide Title

/ Bottom Center
%slide
  .slide-content
    .bottom.tac
      %h1 Slide Title

/ Bottom Right
%slide
  .slide-content
    .bottom.right
      %h1 Slide Title
```

### Grids/Lists

```haml
%slide.slide--light
  .slide-content
    %h1.mbs List of Things
    .g
      .g-b.g-b--1of2
        %ul
          %li One thing
          %li Here's another thing
          %li And another
      .g-b.g-b--1of2
        %ul
          %li Oh man! Another thing
          %li Here's another thing
          %li And, finally, another
```

### Longer Text

```haml
%slide
  .slide-content
    .bottom
      %p.tsxl
        What would happen if I put some longer, more thought-provoking
        text here that fills up more space?
```

### Quote

```haml
%slide
  .slide-content
    .bottom
      %blockquote.mbxs
        "What would happen if I put some longer, more thought-provoking
        text here that fills up more space?"
      %p &mdash; Drew Barontini
```

### Image Overlay

```haml
/ Basic
%slide.slide--fade(img='IMAGE_URL')
  .slide-content
    .middle.tac
      %h1.mbxs Slide Title
      %p This is standard slide.

/ Dark
%slide.slide--fade.slide--fade--dark(img='IMAGE_URL')
  .slide-content
    .middle.tac
      %h1.mbxs Slide Title
      %p This is standard slide.

/ Light
%slide.slide--fade.slide--fade--light(img='IMAGE_URL')
  .slide-content
    .middle.tac
      %h1.mbxs Slide Title
      %p This is standard slide.

/ Success
%slide.slide--fade.slide--fade--success(img='IMAGE_URL')
  .slide-content
    .middle.tac
      %h1.mbxs Slide Title
      %p This is standard slide.

/ Error
%slide.slide--fade.slide--fade--error(img='IMAGE_URL')
  .slide-content
    .middle.tac
      %h1.mbxs Slide Title
      %p This is standard slide.

/ Warning
%slide.slide--fade.slide--fade--warning(img='IMAGE_URL')
  .slide-content
    .middle.tac
      %h1.mbxs Slide Title
      %p This is standard slide.
```

### Full-screen GIF/Image

```haml
/ Contain
%slide.slide--contain(img='IMAGE_URL')

/ Fill
%slide(img='IMAGE_URL')

/ Inset
%slide.slide--inset(img='IMAGE_URL')

/ Tiled
%slide.slide--tile(img='IMAGE_URL')

/ Local
%slide(img="#{image_path('IMAGE_URL')}")
```

### Video (YouTube)

You can use the `%yt-video` directive to load a responsive YouTube video. Just add:

- The width
- The height
- The embed ID

```haml
%slide.slide--video
  .middle.tac
    .slide-video
      %yt-video(width="1280" height="720" video-src="xZY43QSx3Fk")
```

Slide Transitions
-----------------

- Use the `right arrow` or `spacebar` to move right.
- Use the `left arrow` to move left.

### Alternate Slide Effects Per Slide

This will only occur on the `.slide-content` within each slide. If you just have a fullscreen image, or no `.slide-content`, the slide will just use the normal fade in/out transition. If you do have the `.slide-content` section, which you *almost* always should, then you can apply a few different slide transitions per slide, like so:

```haml
/ Scale
%slide.slide--scale
  .slide-content
    / ...

/ Translate X
%slide.slide--translateX
  .slide-content
    / ...

/ Translate Y
%slide.slide--translateY
  .slide-content
    / ...
```

### Remove Transition From All Slides

`source/assets/stylesheets/foundation/_settings.sass`:
```sass
$slide-transition: false
```

### Remove Transition From a Single Slide

```haml
%slide.noTransition
  .slide-content
    .middle.tac
      %h1 Slide Title
```

Defining Sections
-----------------

When you're slides get long enough, you might want to jump through sections (like chapters of a book) more easily. Add the following to your `%slide` to define a section:

```haml
%slide(section)
  .slide-content
    %h1 Slide Title
```

Just add the `section` attribute, and now you can cycle through defined sections using the `S` keyboard shortcut.

Spacing
-------

By default, no elements have any `margin` or `padding` to  keep the vertical alignment nice and happy. If you want to add spacing to headings, paragraphs, lists, etc., use the utility classes for spacing:

```haml
%slide
  .slide-content
    %h1.mbxs Slide Title
    %p A description for the slide.
```

`mbxs` stands for `margin-bottom` `extra-small`, and there are variants for extra-small `xs`, small `s`, medium `m`, large `l`, and extra-large `xl`, for both `margin` and `padding`.

There are other various single-property classes in `source/assets/stylesheets/foundation/_tools.sass` that you can peruse.

Changing Settings
-----------------

If you want to alter the design/settings of the application, open up `sourse/assets/stylesheets/_config.sass`, and uncomment any line that you'd like to override. Available variables:

- Base variables for things like `border-width`, `box-shadow`, and `line-height`
- Base color variables
- Base font variables, including changing the Google `@font-face` header or body font
- Progress bar `height` and `background-color`
- All slide type colors (which generally pull from the base color variables) 
- Slide options for transition `delay`, `speed`, etc.
