# Presenter
Middleman, Angular-powered HTML slides

## Setup

First, we need to install `bundler`, `bundle`, and then start the Middleman
server.

```bash
gem install bundler
bundle install
```

Next, we need to set up the project dependencies via Bower. If you don't have bower installed:

```bash
npm install -g bower
```

Install the dependencies:

```bash
bower install
```

And finally, start the Middleman server:

```bash
middleman s
```

## Creating Slides

All of the slides are in `source/index.haml`. They are written as Angular
directives in Haml.

Here are some different slide types you can use:

### Basic Slide

```haml
/ Text
%slide
  .slide-content
    %h1 Slide Title

/ Centered Text + Subtitle
%slide
  .slide-content
    .middle.middle--lrg.tac
      %h1.mbf Another Title
      %p This is a subtitle.

/ Image
%slide
  .slide-content
    .middle.middle--lrg.tac
      = image_tag 'http://placehold.it/800x400', alt: 'Placeholder', class: 'slide-img'
```

#### Colors

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
```

#### Code

```haml
%slide.slide--light
  .slide-content
    .middle.middle--med
      - code('sass') do
        :plain
          // Code goes here...
```

#### Positioning


```haml
/ Middle
%slide
  .slide-content
    .middle
      %h1 Slide Title

/ Middle Center
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
```

#### Grids/Lists

```haml
%slide.slide--light
  .slide-content
    %h1.mbs List of Things
    .grid
      .grid-box.grid-box--1of2
        %ul
          %li One thing
          %li Here's another thing
          %li And another
      .grid-box.grid-box--1of2
        %ul
          %li Oh man! Another thing
          %li Here's another thing
          %li And, finally, another
```

#### Longer Text

```haml
%slide
  .slide-content
    .middle.middle--lrg
      %p.mbf.tsxl
        What would happen if I put some longer, more thought-provoking
        text here that fills up more space?
```

#### Quote

```haml
%slide
  .slide-content
    .middle.middle--lrg
      %blockquote
        "What would happen if I put some longer, more thought-provoking
        text here that fills up more space?"
      %p.mbf &mdash; Drew Barontini
```

#### Image Overlay

```haml
/ Basic
%slide.slide--fade(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title

/ Dark
%slide.slide--fade.slide--fade--dark(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title

/ Light
%slide.slide--fade.slide--fade--light(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title

/ Success
%slide.slide--fade.slide--fade--success(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title

/ Error
%slide.slide--fade.slide--fade--error(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title

/ Warning
%slide.slide--fade.slide--fade--warning(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title
```

#### Full-screen GIF/Image

```haml
/ Contain
%slide.slide--contain(img='http://gificiency.com/m/excited-parks.gif')

/ Fill
%slide(img='http://gificiency.com/m/excited-parks.gif')

/ Tiled
%slide.slide--tile(img='http://gificiency.com/m/excited-parks.gif')

/ Local
%slide(img="#{image_path('image.jpg')}")
```
