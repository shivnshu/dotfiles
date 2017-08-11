;;; misc-pkg.el --- packages config (Provides misc packages to emacs)
;;; Commentary:

;;; Code:

(require 'use-package)

;; ethan-wspace deals with correct whitespaces usage
(use-package ethan-wspace
  :ensure t
  :config
  (setq mode-require-final-newline nil)
  (global-ethan-wspace-mode t))

;; guide your eye during scrolling
(use-package on-screen
  :ensure t)

;; Markdown major mode
(use-package markdown-mode
  :ensure t
  :defer t)

;; unicode fonts support
(use-package unicode-fonts
  :ensure t
  :defer t)

;; highlights delimiters
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; support tex files
(use-package auctex
  :ensure t
  :defer t)

;; minor mode for redo and undo window configuration
;; Use C-c <left> and C-c <right> for undo and redo
(use-package winner
  :ensure t
  :config
  (winner-mode 1))

;; nice relative numbering
(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-on)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 1)
  (setq nlinum-relative-current-symbol "->")
  (setq nlinum-relative-offset 1))

;; visual way of switching windows
(use-package switch-window
  :ensure t
  :bind (("M-o"   . switch-window)
         ("C-x o" . other-window)))

;; diminish mode for diminishing(i.e. not reminding us) some essential modes
(use-package diminish
  :ensure t
  :config
  (diminish 'auto-revert-mode)
  ;;(diminish 'yas-minor-mode)
  )

;; saveplace pkg for saving the cursor point for each file
(use-package saveplace
  :init (save-place-mode))

;; nice for deleting stuff inside and including some characters(eg. "")
(use-package change-inner
  :ensure t
  :config
  (global-set-key (kbd "M-S-i") 'change-inner)
  (global-set-key (kbd "M-S-o") 'change-outer))

;; multi-term for managing multiple terminal buffers
(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program "/bin/zsh")
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)))
  (add-hook 'term-mode-hook
            (lambda ()
              (define-key term-raw-map (kbd "C-y") 'term-paste))))

;; js2-mode for improved js
(use-package js2-mode
  :ensure t
  :config
  (setq js-indent-level 2)
  (add-hook 'js2-mode-hook 'flycheck-mode))

;; Make env variables of emacs shell same as the host shell
(use-package exec-path-from-shell
  :ensure t)

;; multiple cursors like sublime
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; Emacs support to pdf
;; (use-package pdf-tools)

;; aggressive-indent minor mode
(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode) ;; for elisp
  (add-hook 'css-mode-hook #'aggressive-indent-mode)) ;; for css

(provide 'misc-pkg)

;;; misc-pkg.el ends here
