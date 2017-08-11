;;; appearance.el --- config for appearance
;;; Commentary:

;;; Code:

(require 'use-package)

;; Highlight the current line
(global-hl-line-mode)

;; jbeans theme
(use-package jbeans-theme
  :ensure t)

;; cursor-chg package (change cursor as per the context)
(use-package cursor-chg
  :ensure t
  :config
  (change-cursor-mode 1))

;; Ensure that theme is loaded when running in daemon mode
(if (daemonp)
    (add-hook 'after-make-frame-functions
          (lambda (frame)
        (select-frame frame)
        (load-theme 'jbeans t)

        ;; Fonts
        (setq default-frame-alist '((font . "Literation Mono Powerline-14")
                        (alpha 95 95)
                        ))

        ;; Remove tools, scroll etc.
        (tool-bar-mode -1)
        (scroll-bar-mode -1)
        (blink-cursor-mode -1)
        (menu-bar-mode -1)
        )))

;; Fonts
(setq default-frame-alist '((font . "Literation Mono Powerline-14")
                (alpha 95 95)
                ))

;; change font size when a file buffer loads
;; use window-setup-hook as to run this function after settings up windows (bug fixed)
(add-hook 'window-setup-hook (lambda () (set-face-attribute 'default nil :height 160)))

;; fix stuff that doesn't work in non-daemon mode
(when window-system
  (load-theme 'jbeans t)
  (setq default-frame-alist '((font . "Literation Mono Powerline-14")
                              (alpha 95 95)
                              ))

  ;; tools, scroll etc.
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (menu-bar-mode -1)
  )

(provide 'appearance)
;;; appearance.el ends here
