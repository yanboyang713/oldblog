# Making Slideshows From Emacs Org Mode with org-reveal


## Introduction {#introduction}

In this article, I will talk about **How to using Emacs with org-reveal to make a slideshows**. This article will based on [Jake](https://www.youtube.com/watch?v=avtiR0AUVlo)'s video in **YouTube**.


## Doom Emacs Set-up {#doom-emacs-set-up}

Setting up org-reveal within Doom Emacs is straightforward.

1.  Add these lines to your **packages.el**:

    ```emacs-lisp
       ;; ~/.doom.d/packages.el
       (package! org-reveal)
       (package! ox-reveal)
    ```
2.  Add some optional configuration to your **config.el**.

    ```emacs-lisp
       ;; ~/.doom.d/config.el
       (after! org
         (load-library "ox-reveal")
         (setq org-reveal-root "file:///path/to/reveal.js-master"))
    ```

    **NOTE**: If you omit this, you must add the **Basic Header** below at the top of each org-mode file, so org-reveal can find the javascript.


## Basic Header {#basic-header}

```nil

:REVEAL_PROPERTIES:
#+REVEAL_ROOT: https://cdn.jsdelivr.net/npm/reveal.js
#+REVEAL_REVEAL_JS_VERSION: 4
:END:

#+TITLE: Reveal JS Presentation
#+SUBTITLE: Straightforward Emacs - org-reveal
#+AUTHOR: Boyang Yan
```

Now, let's we try to **exporting**.


## Exporting {#exporting}

In Doom with Vim keybindings, exporting is **SPC m e R B** to export as html and then open the page in your default web browser. After the first export, you can do **SPC m e R R** to rewrite the existing html and refresh the page manually.

If you like the default settings, that’s all you need! But if you want customizations, read on.


## Basic Usage: {#basic-usage}

1.  Overview Mode: you can type **o**, enter to **overview mode**.
2.  Next Sides: type **space**.


## More Customize {#more-customize}

1.  Themes

    ```file
       #+REVEAL_THEME: serif
    ```
2.  Options

    ```file
       #+OPTIONS: timestamp:nil toc:1 num:nil
    ```
3.  Doing not every element into a sigle slide

    ```org
       ;* Intro Slideshows
       #+ATTR_REVEAL: :frag (appear)
       1) Point one
       2) Point two
    ```
4.  Add Image

    ```org
       ;* Image
       #+ATTR_HTML: :width 45% :align center

       https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/EmacsIcon.svg/1200px-EmacsIcon.svg.png
    ```


## Full Example {#full-example}

```org
#+TITLE: Org-Reveal Video
#+AUTHOR: Jake B - https://www.youtube.com/channel/UCBMMB7Yi0eyFuY95Qn2o0Yg/
#+DATE: [2021-09-02 Thu]
:PROPERTIES:
#+OPTIONS:
:END:

;* Installing org-reveal
#+BEGIN_SRC emacs-lisp
  (use-package ox-reveal)
```

;\* First export
;\*\* Basic Header

```nil

:REVEAL_PROPERTIES:
#+REVEAL_ROOT: https://cdn.jsdelivr.net/npm/reveal.js
#+REVEAL_REVEAL_JS_VERSION: 4
:END:

#+TITLE: Reveal JS Presentation
#+SUBTITLE: Straightforward Emacs - org-reveal
#+AUTHOR: Jake B
```

;\* Improving your export

1.  <kbd>#+REVEAL_THEME:</kbd>
    -   <https://revealjs.com/themes/>
2.  <kbd>#+OPTIONS: timestamp:nil toc:1 num:nil</kbd>
3.  <kbd>#+REVEAL_INIT_OPTIONS: slideNumber:true</kbd>
    -   <https://revealjs.com/config/>

;\* #+ATTR_HTMLs
;\*\* Step-by-step elements
<https://revealjs.com/fragments/>
<kbd>#+ATTR_REVEAL: :frag (appear)</kbd>
;\*\* Images

```org
  #+ATTR_HTML: :width 45% :align center
  https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/EmacsIcon.svg/1024px-EmacsIcon.svg.png
```

;\* Notes
You can write speaker notes within org-reveal using the `#+BEGIN_NOTES` and `#+END_NOTES` lines. These notes can be seen in a speaker window. You open this window by pressing the `s` key on your reveal.js presentation, like so.

;\* Links

-   <https://github.com/yjwen/org-reveal>
-   <https://revealjs.com/>
    -   <https://revealjs.com/config/>
    -   <https://revealjs.com/themes/>
    -   <https://revealjs.com/fragments/>

\#+end_src


## Reference List {#reference-list}

1.  <https://www.youtube.com/watch?v=avtiR0AUVlo>
2.  <https://github.com/yjwen/org-reveal>
3.  <https://revealjs.com/>
4.  <https://alexshroyer.com/posts/2021-08-13-Org-Reveal.html>

