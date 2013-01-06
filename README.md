# Twig minor mode for emacs

twig.el is a small library to integrate a few features of Twig in Emacs.

If your are interested in contributing in the file, you're free to send a pull request.

After that, just 

`(require 'twig)` 

`(setq auto-mode-alist
      (append '(("\\.twig?$" . twig-minor-mode)) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.twig$" . twig-minor-mode))
`
in your .emacs, and you're good to go.

