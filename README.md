# Presenter
Middleman, Angular-powered HTML slides

## Setup

```bash
gem install bundler
bundle install
middleman s
```

## Creating Slides

### Basic Slide

```haml
%slide
  .slide-content
    %h1 Slide Title
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
    .middle.middle--code
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

#### Longer Text

```haml
%slide
  .slide-content
    .middle.middle--text
      %p.tsxl
        What would happen if I put some longer, more thought-provoking
        text here that fills up more space?
```

#### GIF/Image

```haml
%slide(img='http://gificiency.com/m/excited-parks.gif')
```
