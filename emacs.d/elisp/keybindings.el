;;; keybindings.el ---  define keybindings
;;; Commentary:

;;; Code:

(require 'package)

;; Resize windows
(global-set-key (kbd "C-x <up>") 'shrink-window)
(global-set-key (kbd "C-x <down>") 'enlarge-window)
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)

;; Switch to other window
(global-set-key "\M-o" 'other-window)

(provide 'keybindings)
;;; keybindings.el ends here
