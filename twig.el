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

(defun twig-for (variable in-variable create-else)
  "create-a-for-block"
  (interactive 
   (list
    (read-string "Variable:")
    (read-string "In variable:")
    (y-or-n-p "Create else statement?")
    ))
  (insert (concat "{% for " variable " in " in-variable " %}"))
  (newline)
  (setq point-to-insert (point))
  (newline)
  (if create-else 
      (progn
	(insert "{% else %}")
	(newline)
     )
    )
  (insert (concat "{% endfor %}"))
  (goto-char point-to-insert)
  (indent-according-to-mode)
)

(defun twig-insert-variable (var-name)
  "insert-a-variable"
  (interactive
   (list 
   (read-string "Variable:")
    ))
  (insert (concat "{{ " var-name " }}"))
)

(defun twig-insert-function (function-name)
  "insert-a-function"
  (interactive
   (list 
   (read-string "Function:")
    ))
  (insert (concat "{% " function-name " %}"))
)

(defun twig-insert-condition (condition-param create-else)
  "insert-a-condition"
  (interactive
   (list 
   (read-string "Condition:")
   (y-or-n-p "Insert else statement?")
    ))
  (insert (concat "{% if " condition-param " %}"))
  (newline)
  (setq point-to-insert (point))
  (newline)
  (if create-else 
      (progn
	(insert "{% else %}")
	(newline)
     )
    )
  (insert (concat "{% endfif %}"))
  (goto-char point-to-insert)
  (indent-according-to-mode)
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

(define-key twig-mode-keymap
  (kbd "C-c C-t x")
  'twig-insert-function
)

(define-key twig-mode-keymap
  (kbd "C-c C-t i")
  'twig-insert-condition
)

;;Make a menu
(define-key twig-mode-keymap [menu-bar] (make-sparse-keymap))
(define-key twig-mode-keymap [menu-bar twig]
  (cons "Twig" (make-sparse-keymap "Twig")))

;; Define specific subcommands in this menu.
(define-key twig-mode-keymap [menu-bar twig trans-text]
  '("Insert Translate Block" . twig-trans-text))

(define-key twig-mode-keymap [menu-bar twig trans-region]
  '("Translate Region" . twig-trans-region))

(define-key twig-mode-keymap [menu-bar twig create-block]
  '("Create A New Block" . twig-create-block))

(define-key twig-mode-keymap [menu-bar twig for]
  '("Insert For Loop" . twig-for))

(define-key twig-mode-keymap [menu-bar twig insert-variable]
  '("Insert Variable" . twig-insert-variable))

(define-key twig-mode-keymap [menu-bar twig insert-function]
  '("Insert Function" . twig-insert-function))

(define-key twig-mode-keymap [menu-bar twig insert-condition]
  '("Insert Condition" . twig-insert-condition))

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
