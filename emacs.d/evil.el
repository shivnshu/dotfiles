;;; evil.el --- startup config for evil mode
;;; Commentary:

;;; Code:

(require 'use-package)

;; Load some specific files
(use-package appearance :load-path "elisp/")
(use-package keybindings :load-path "elisp/")
(use-package misc-pkg :load-path "elisp/")

(use-package mode-line :load-path "elisp/")

;; Emacs plugin neotree like Nerdtree for vim
(use-package neotree
  :ensure t
  :config
  (progn
    (setq-default neo-smart-open t) ; try to find current file and jump to that node
    (setq-default neo-dont-be-alone t) ; Dont be an alone window
    )
  (global-set-key [f8] 'neotree-toggle) ; f8 key for neotree toggle
  (progn
    (bind-keys
     :map neotree-mode-map
     ("<C-return>" . neotree-change-root)
     ("C"          . neotree-change-root)
     ("c"          . neotree-create-node)
     ("+"          . neotree-create-node)
     ("d"          . neotree-delete-node)
     ("r"          . neotree-rename-node))))

;; flycheck minor mode for syntax checking on the run
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; vim easymotion like plugin to jump to words
;; (use-package avy
;;   :ensure t
;;   :bind
;;   (("C-;"     . avy-goto-char)
;;    ("C-'"     . avy-goto-char-timer)
;;    ("C-c SPC"  . avy-goto-word-or-subword-1))
;;   :config
;;   (avy-setup-default))

;; Switch windows easily
(use-package ace-window
  :ensure t
  :bind
  (("C-."    . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; Easier to edit root files
(use-package sudo-save :load-path "elisp/")

;; go to last change location
(use-package goto-chg
  :ensure t
  :commands goto-last-change
  :bind (("C-." . goto-last-change)
         ("C-," . goto-last-change-reverse)))

;; pop window
(use-package popup-imenu
  :ensure t
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))

;; for git
(use-package magit
  :ensure t
  :bind (("C-c C-g" . magit-status)))

;; git highlight uncommited changes
(use-package diff-hl
  :ensure t)

;; org major mode
(use-package org
  :ensure t
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cg" 'org-show-subtree)
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)
  (setq org-log-done t)
  (eval-after-load "org"
    '(require 'ox-md nil t)))

;; smart parenthesis
(use-package sp-init :load-path "elisp/")

;; Set evil-mode
(use-package evil
  :ensure t
  :config
  (evil-mode t))

;; helm package (incremental completion)
(use-package helm
  :ensure t
  :config
  (helm-mode 1))

(defun nmap (keys fxn)
  "Maps KEYS to FXN in Normal Mode."
  (define-key evil-normal-state-map (kbd keys) fxn))

(defun mmap (keys fxn)
  "Maps KEYS to FXN in Motion Mode."
  (define-key evil-motion-state-map (kbd keys) fxn))

(defun vmap (keys fxn)
  "Maps KEYS to FXN in Visual Mode."
  (define-key evil-visual-state-map (kbd keys) fxn))

(defun imap (keys fxn)
  "Maps KEYS to FXN in Insert Mode."
  (define-key evil-insert-state-map (kbd keys) fxn))

;;; Escape key works for normal stuff
;; Bind escape to quit
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Fix the ctrl-u scroll issue
(nmap "C-u" 'evil-scroll-up)
(vmap "C-u" 'evil-scroll-up)
(imap "C-u" '(lambda ()
               (interactive)
               (evil-delete (point-at-bol) (point))))

;; Window switching made easy
(nmap "C-l" 'evil-window-right)
(nmap "C-h" 'evil-window-left)
(nmap "C-j" 'evil-window-down)
(nmap "C-k" 'evil-window-up)

(nmap "C-p" 'helm-projectile)
(nmap "C-S-p" 'helm-projectile-recentf)

;; Make movement keys work like they should
(nmap "<remap> <evil-next-line>" 'evil-next-visual-line)
(nmap "<remap> <evil-previous-line>" 'evil-previous-visual-line)
(mmap "<remap> <evil-next-line>" 'evil-next-visual-line)
(mmap "<remap> <evil-previous-line>" 'evil-previous-visual-line)

(find-function-on-key (kbd "M-."))

;; Make horizontal movement cross lines
;; (setq-default evil-cross-lines t)

;;; some evil mode packages

;; evil commenter
(use-package evil-nerd-commenter
  :ensure t)

;; key-chord lets you redefine keys
;; commenting made simpler by "//" in normal mode
(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-normal-state-map "//"
                    #'evilnc-comment-or-uncomment-lines))

;; just like vim surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; just like vim matchit
(use-package evil-matchit
  :ensure t
  :config
  (global-evil-matchit-mode 1))

;; multi-cursor
(use-package evil-multiedit
  :ensure t
  :config
  ;; Highlights all matches of the selection in the buffer.
  (define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

  ;; Match the word under cursor (i.e. make it an edit region). Consecutive
  ;; presses will incrementally add the next unmatched match.
  (define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
  ;; Match selected region.
  (define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)

  ;; Same as M-d but in reverse.
  (define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
  (define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

  ;; OPTIONAL: If you prefer to grab symbols rather than words, use
  ;; `evil-multiedit-match-symbol-and-next` (or prev).

  ;; Restore the last group of multiedit regions.
  (define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

  ;; RET will toggle the region under the cursor
  (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

  ;; ...and in visual mode, RET will disable all fields outside the selected
  ;; region
  (define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

  ;; For moving between edit regions
  (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
  (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
  (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
  (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

  ;; Allows you to invoke evil-multiedit with a regular expression
  (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)
  )

;; just like vim-seek
(use-package evil-snipe
  :ensure t
  :config
  (evil-snipe-mode 1)
  (setq evil-snipe-scope 'whole-visible))

;; newer magit binding
(use-package evil-magit
  :init (exec-path-from-shell-initialize)
  :ensure t)

;; an awesome pkg for browsing file system
(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t)
  (setq ranger-cleanup-eagerly t)
  ;; (setq ranget-dont-show-binary t)
  )

;; Load development environment specific config files
(use-package py-init :load-path "elisp/")

(provide 'evil)

;;; evil.el ends here
