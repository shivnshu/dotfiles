;;; init.el -- Main load file for emacs
;;; Commentary:

;;; Code:

(require 'package)

;; Set up repositories of packages
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ("marmalade" . "http://marmalade-repo.org/packages/")
                    ("elpy" . "https://jorgenschaefer.github.io/packages/")))

(package-initialize)

(add-to-list 'load-path "elisp/")

;; use-package is required for subsequent config
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load-file "$HOME/.emacs.d/evil.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; General settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shorter yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Stop startup message
(setq inhibit-startup-message 1)

;; Scrolling
(setq-default scroll-step 4)

;; No beeping
(setq-default visible-bell 1)

;; Enable kill-line functionality
(setq-default kill-whole-line 1)

;; Set tab width
(setq-default tab-width 4)

;; disable
(setq-default indent-tabs-mode nil)

;; Enable recent menu functionality
(recentf-mode 1)
(setq-default recentf-save-file "~/.emacs.d/recentf")

;; Enable cua minor mode (enable ctl-c ctl-v copy paste)
(cua-mode)

;; Non-jumpy scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Show matching parenthesis
(show-paren-mode t)

;; Set frame title
(setq frame-title-format '(buffer-file-name "%f - Emacs" ("%b - Emacs")))

;; Indent with return
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Mouse
(require 'mouse)
(xterm-mouse-mode)

;; Desktop save mode
(desktop-save-mode 1)

;; Misc
(setq line-move-visual 1) ; line wraps on word endings
(visual-line-mode 1)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Change defination of word by considering CamelCase
(subword-mode)

;; Retain pointer at same place
(setq scroll-preserve-screen-position t)

;; Nice PDF support
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package paredit
  :ensure t)
(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'emacs-lisp-mode-hook
      (lambda ()
        (paredit-mode t)
        (rainbow-delimiters-mode t)
        (show-paren-mode 1)
        ))

(add-hook 'lisp-interaction-mode
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)
            ))


;; Put column number into modeline
;; (column-number-mode 1)

;; Make minibuffer larger if there is more to see
;; (resize-minibuffer-mode 1)

;; set initial welcome mode
(setq initial-major-mode 'lisp-interaction-mode)

(provide 'init)
;;; init.el ends here


;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(custom-safe-themes
  (quote
   ("64f2981274fd8740b794bce9feee7949ed87b88fc0b4654bd98594e1aa81abcd" default)))
'(package-selected-packages
  (quote
   (cursor-chg magit company rainbow-delimiters paredit jbeans-theme evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (spaceline evil-avy markdown-mode linum-relative use-package rainbow-delimiters paredit magit-popup jbeans-theme helm git-commit evil cursor-chg company))))
