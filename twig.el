;;;###autoload
(defgroup twig nil
  "Convenience functions for working with Twig"
  :prefix "twig-"
  :group 'convenience
)

(defun twig-trans-text (text)
  "print-a-text-in-a-twig-trans-label"
  (interactive "sText:")
  (insert (concat "{% trans %}" text "{% endtrans %}"))
)

(defun twig-trans-region ()
  "include-a-region-between-trans-labels"
  (interactive)
  "print-a-text-in-a-twig-trans-label"
  (goto-char (region-end))
  (insert "{% endtrans %}")
  (goto-char (region-beginning))
  (insert "{% trans %}")
)

(defun twig-create-block (block-name)
  "create-an-empty-block"
  (interactive "sBlock-Name:")
  (insert (concat "{% block " block-name " %}"))
  (newline)
  (newline)
  (insert (concat "{% endblock " block-name " %}"))
  (previous-line)
)

(defun twig-for (variable in-variable)
  "create-a-for-block"
  (interactive 
   (list
    (read-string "Variable:")
    (read-string "In variable:")
    ))
  (insert (concat "{% for " variable " in " in-variable " %}"))
  (newline)
  (setq point-to-insert (point))
  (newline)
  (insert "{% else %}")
  (newline)
  (insert (concat "{% endfor %}"))
  (goto-char point-to-insert)
)

(defun twig-insert-variable (var-name)
  "insert-a-variable"
  (interactive
   (list 
   (read-string "Variable:")
    ))
  (insert (concat "{{ " var-name " }}"))
)

(defvar twig-mode-keymap (make-keymap)
  "keymappings for twig-mode"
)

(define-key twig-mode-keymap
  (kbd "C-c C-t t")
  'twig-trans-text
)

(define-key twig-mode-keymap
  (kbd "C-c C-t r")
  'twig-trans-region
)

(define-key twig-mode-keymap
  (kbd "C-c C-t b")
  'twig-create-block
)

(define-key twig-mode-keymap
  (kbd "C-c C-t f")
  'twig-for
)

(define-key twig-mode-keymap
  (kbd "C-c C-t v")
  'twig-insert-variable
)

;;;###autoload
(define-minor-mode twig-minor-mode
  nil                  ;default docstring
  nil                  ;initial value
  "[twig]"              ;mode line indicator
  twig-mode-keymap ;keymap
  :group 'twig
)

(defun twig-minor-mode-on ()
  (interactive)
  (twig-minor-mode t)
)

(defun twig-minor-mode-off ()
  (interactive)
  (twig-minor-mode nil)
)

(provide 'twig)
;;;twig.el ends here
