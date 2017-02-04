;;; init.el --- Main load file for emacs
;;; Commentary:
;;; No longer do I keep a ~/.emacs file.

;;; Code:

(require 'package)

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(add-to-list 'load-path "elisp/")

(eval-when-compile
  (require 'use-package))

(load-file "$HOME/.emacs.d/holy.el")
;;(load-file "$HOME/.emacs.d/evil.el")

;;(use-package exwm-init)

;; Welcome message
(setq initial-major-mode 'lisp-interaction-mode)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (flycheck-rust racer rust-mode go-eldoc pug-mode helm-css-scss scss-mode php-mode web-mode clang-format company-irony-c-headers flycheck-irony elisp-slime-nav racket-mode company-emacs-eclim eclim ensime elpy tide latex-preview-pane smartparens diff-hl magit goto-chg ace-window avy company-tern slime-company company-quickhelp company-restclient company-math company-irony company-go company-ghci company-ghc company-c-headers company-cabal company-auctex company helm-ls-git helm-ag helm-make helm-swoop helm-projectile helm flycheck erc-hl-nicks aggressive-indent pdf-tools multiple-cursors exec-path-from-shell js2-mode multi-term change-inner switch-window nlinum-relative smbc use-package unicode-fonts rainbow-delimiters on-screen neotree markdown-mode jbeans-theme ethan-wspace cursor-chg auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
