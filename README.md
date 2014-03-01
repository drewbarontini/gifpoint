# Presenter
Middleman, Angular-powered HTML slides

## Setup

First, we need to install `bundler`, `bundle`, and then start the Middleman
server.

```bash
gem install bundler
bundle install
middleman s
```

## Creating Slides

All of the slides are in `source/index.haml`, and below are some different
slide types you can use.

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
/ Dark
%slide.slide--fade.slide--fade--dark(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title

/ Dark
%slide.slide--fade.slide--fade--light(img='http://farm8.staticflickr.com/7435/10192809164_82f31c7b1c_o.jpg')
  .slide-content
    .middle.tac
      %p.h4.mbf Subtitle
      %h1 Slide Title
```

#### GIF/Image

```haml
/ Fill
%slide(img='http://gificiency.com/m/excited-parks.gif')

/ Tiled
%slide.slide--tile(img='http://gificiency.com/m/excited-parks.gif')
```
